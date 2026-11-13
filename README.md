# dotfiles

macOS / Linux 向けの個人用設定です。会社のサービス URL、認証情報、業務用 Git ID はリポジトリに含めず、端末ローカルのファイルで管理します。

## セットアップ

このリポジトリを `~/dotfiles` に置いて使います。`make setup` は Git、Herdr、Ghostty の設定をセットアップします。既存の Herdr / Ghostty 設定はバックアップし、Git の既存グローバル設定は保持して include を追加します。

Zsh、Neovim、Zed は必要な設定を次の場所にリンクしてください。既存ファイルがある場合は先にバックアップしてください。

| リポジトリ内 | リンク先 |
| --- | --- |
| `.zshenv` / `.zprofile` / `.zshrc` | `~/.zshenv` / `~/.zprofile` / `~/.zshrc` |
| `nvim` | `~/.config/nvim` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |

Neovim は 0.11 以降と Git、Telescope の検索には ripgrep、fzf 拡張のビルドには make / C コンパイラが必要です。初回起動時に lazy.nvim がプラグインを取得します。Kotlin の LSP は `:MasonInstall kotlin-lsp` で別途インストールします。`:KotlinLspStatus` で状態を確認し、必要に応じて `:KotlinLspUpdate` を実行します。

履歴・ディレクトリ検索には peco を使用します。`Option+2` は Ghostty の Option-as-Alt 設定と組み合わせます。Homebrew、SDKMAN、direnv はインストールされていれば読み込みます。

## 会社・端末固有の設定

次のファイルは各端末にだけ置き、コミットしません。

| ファイル | 用途 |
| --- | --- |
| `~/.zshenv.local` | 全 Zsh セッションで必要な環境変数 |
| `~/.zprofile.local` | ログインシェル固有の設定 |
| `~/.zshrc.local` | 会社の Gateway URL、モデル設定、その他の対話シェル設定 |
| `~/.gitconfig.local` | Git の名前、メールアドレス、署名鍵 |
| `~/.config/mcp.env` | 1Password のシークレット参照を記載する env ファイル |

Git の署名は有効のままです。macOS では 1Password の SSH 署名プログラムを使用します。利用する端末に合わせ、`~/.gitconfig.local` に ID と署名鍵を設定してください。Linux では利用する SSH 署名環境もローカルで設定してください。

```gitconfig
[user]
  name = Your Name
  email = your-public-email@example.com
  signingkey = ssh-ed25519 YOUR_PUBLIC_SIGNING_KEY
```

`with-mcp-env <command>` は 1Password CLI (`op`) で認証情報を注入します。`cc` は Claude、`cx` / `codex-mcp` は Codex を起動します。対応する CLI と `mcp.env` を用意した端末で使ってください。会社の Gateway / モデル選択は `~/.zshrc.local` に記載します。秘密値の平文コピーをリポジトリ内に作成しないでください。

## 今回の整理

- 取り込み: Homebrew / ローカル設定フック、1Password 経由の CLI 起動、Herdr の環境引継ぎ、Ctrl+L のスクロールバック保持、peco のキー設定、Ghostty のフォント、Neovim の Kotlin LSP と期限切れ検知、Zed 設定。
- 除外: 会社の AI Gateway URL、認証キー、専用モデル ID・Gateway オプション、Git の個人・会社 ID と署名鍵の固定値、エディタの実行ログ。
- 保持・修正: README、Makefile、Git の OS 別設定とセットアップを復元。Git セットアップは既存設定を保持する方式へ変更。

元の作業ツリーはそのまま残し、共通化した内容だけを別ブランチで整理しています。
