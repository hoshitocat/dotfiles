-- kotlin-lsp（JetBrains intellij-server）の期限切れ検知と更新。
--
-- JetBrains の EAP ビルドはビルドごとに有効期限が埋め込まれており、期限を過ぎると
-- LSP のハンドシェイク前に stderr へ
--   "This build of intellij-server has expired. The IDE will now close."
-- を出して終了する。Neovim 側にはエラーが出ないため gd/gr/gi が黙って無反応になる。
--
-- 対策は 2 段構え:
--   1. 事前警告  … インストール済みビルドが古くなったら VimEnter で警告
--   2. 事後検知  … 実際に期限切れで落ちたら on_exit で検知して更新を提案

local M = {}

local PACKAGE = "kotlin-lsp"

-- ビルド日からこの日数を超えたら「そろそろ期限切れる」と警告する。
-- JetBrains は期限を公表していないため、実測（262.7569.0 は 6/9 リリースで
-- 7/30 時点で期限切れ）から余裕を持たせた保守的な値。
local STALE_AFTER_DAYS = 30

-- 期限切れログが「今回の起動によるもの」と判定する猶予秒数。
-- lsp.log は過去のセッションの記録も残るため、これで古い記録を除外する。
local LOG_FRESHNESS_SEC = 300

-- 通知はセッション内で 1 回だけ。
local notified = false

local function notify(msg, level)
  vim.notify("[kotlin-lsp] " .. msg, level, { title = "kotlin-lsp" })
end

---インストール済みパッケージの product-info.json を探す。
---ディレクトリ名にバージョンが入る（kotlin-server-262.9593.0）ため glob で解決する。
---@return string? path
local function product_info_path()
  local root = vim.fn.stdpath("data") .. "/mason/packages/" .. PACKAGE
  local hits = vim.fn.glob(root .. "/*/product-info.json", false, true)
  return hits[1]
end

---@return string? build_number, number? release_epoch
local function installed_build()
  local path = product_info_path()
  if not path then
    return nil, nil
  end

  local ok, content = pcall(vim.fn.readfile, path)
  if not ok then
    return nil, nil
  end

  local decoded_ok, info = pcall(vim.json.decode, table.concat(content, "\n"))
  if not decoded_ok or type(info) ~= "table" then
    return nil, nil
  end

  -- majorVersionReleaseDate は "20260726" 形式。
  local date = tostring(info.majorVersionReleaseDate or "")
  local y, m, d = date:match("^(%d%d%d%d)(%d%d)(%d%d)$")
  if not y then
    return info.buildNumber, nil
  end

  local epoch = os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d), hour = 12 })
  return info.buildNumber, epoch
end

---lsp.log の末尾を読む（全体は数 MB になりうるので末尾だけ）。
---@return string
local function log_tail(bytes)
  local path = vim.lsp.get_log_path()
  local f = io.open(path, "r")
  if not f then
    return ""
  end

  local size = f:seek("end")
  f:seek("set", math.max(0, size - bytes))
  local content = f:read("*a")
  f:close()

  return content or ""
end

---直近に期限切れで落ちた記録が lsp.log にあるか。
---@return boolean
local function expired_recently()
  local latest = nil

  for line in log_tail(65536):gmatch("[^\n]+") do
    if line:find("has expired", 1, true) then
      local y, mo, d, h, mi, s = line:match("%[(%d%d%d%d)-(%d%d)-(%d%d) (%d%d):(%d%d):(%d%d)%]")
      if y then
        latest = os.time({
          year = tonumber(y),
          month = tonumber(mo),
          day = tonumber(d),
          hour = tonumber(h),
          min = tonumber(mi),
          sec = tonumber(s),
        })
      end
    end
  end

  if not latest then
    return false
  end

  return (os.time() - latest) <= LOG_FRESHNESS_SEC
end

---レジストリを更新してから kotlin-lsp を強制再インストールする。
---（:MasonUpdate → :MasonInstall kotlin-lsp --force と同じ流れ）
function M.update()
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    notify("mason-registry を読み込めませんでした。手動で :MasonUpdate してください。", vim.log.levels.ERROR)
    return
  end

  notify("レジストリを更新中…", vim.log.levels.INFO)

  registry.update(function(success)
    vim.schedule(function()
      if not success then
        notify("レジストリの更新に失敗しました。", vim.log.levels.ERROR)
        return
      end

      local has_pkg, pkg = pcall(registry.get_package, PACKAGE)
      if not has_pkg then
        notify(PACKAGE .. " がレジストリに見つかりません。", vim.log.levels.ERROR)
        return
      end

      notify(("%s を再インストール中…（約 1.2GB、数分かかります）"):format(PACKAGE), vim.log.levels.INFO)

      pkg:install({ force = true }, function(install_ok)
        vim.schedule(function()
          if install_ok then
            local build = installed_build()
            notify(
              ("更新完了: %s。Neovim を再起動してください。"):format(build or "unknown"),
              vim.log.levels.INFO
            )
          else
            notify("再インストールに失敗しました。:Mason でログを確認してください。", vim.log.levels.ERROR)
          end
        end)
      end)
    end)
  end)
end

---期限切れを検知したときの案内。確認して y なら更新を実行する。
local function on_expired()
  if notified then
    return
  end
  notified = true

  notify(
    "サーバーのビルドが期限切れです。gd/gr/gi は動きません。",
    vim.log.levels.ERROR
  )

  local choice = vim.fn.confirm(
    "[kotlin-lsp] ビルドが期限切れです。今すぐ更新しますか？\n（約 1.2GB のダウンロードが発生します）",
    "&Yes\n&No",
    2
  )

  if choice == 1 then
    M.update()
  else
    notify("あとで :KotlinLspUpdate を実行してください。", vim.log.levels.WARN)
  end
end

---LSP クライアントが落ちたときのフック。期限切れが原因かを判定する。
---@param code integer
function M.on_exit(code)
  if code == 0 then
    return
  end

  vim.schedule(function()
    if expired_recently() then
      on_expired()
    end
  end)
end

---インストール済みビルドが古ければ、期限切れ前に警告する。
local function check_staleness()
  local build, released = installed_build()
  if not build or not released then
    return
  end

  local age_days = math.floor((os.time() - released) / 86400)
  if age_days < STALE_AFTER_DAYS then
    return
  end

  notify(
    ("ビルド %s はリリースから %d 日経過しています。期限切れになる前に :KotlinLspUpdate を実行してください。")
      :format(build, age_days),
    vim.log.levels.WARN
  )
end

---現在の状態を返す（:KotlinLspStatus 用）。
---@return table
function M.status()
  local build, released = installed_build()
  return {
    build = build,
    released = released and os.date("%Y-%m-%d", released) or nil,
    age_days = released and math.floor((os.time() - released) / 86400) or nil,
    stale = released ~= nil and (os.time() - released) / 86400 >= STALE_AFTER_DAYS,
    expired_in_log = expired_recently(),
  }
end

function M.setup()
  vim.api.nvim_create_user_command("KotlinLspUpdate", function()
    M.update()
  end, { desc = "kotlin-lsp を最新ビルドに更新する（レジストリ更新 + 強制再インストール）" })

  vim.api.nvim_create_user_command("KotlinLspStatus", function()
    local s = M.status()
    print(("build=%s released=%s age=%s days stale=%s expired_in_log=%s"):format(
      s.build or "not installed",
      s.released or "?",
      s.age_days or "?",
      tostring(s.stale),
      tostring(s.expired_in_log)
    ))
  end, { desc = "kotlin-lsp のビルド情報と期限切れ状態を表示する" })

  -- 起動を遅くしないよう、チェックは起動後に延ばす。
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      vim.defer_fn(check_staleness, 2000)
    end,
  })
end

return M
