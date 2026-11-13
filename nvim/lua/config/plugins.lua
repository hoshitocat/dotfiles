-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "tpope/vim-surround" },

  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Prioritize loading this package over others.
    config = function()
      vim.cmd("colorscheme tokyonight-storm")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- show the name of the person who changed the current line
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
        },
      })
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          path_display = { "filename_first" },
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              preview_height = 0.6,
              preview_cutoff = 0,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension("fzf")

      local builtin = require("telescope.builtin")

      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
      vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions)
    end,
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        end,
      })

      -- JetBrains 公式 kotlin-lsp（mason の `kotlin-lsp` パッケージ）
      -- 旧 kotlin_language_server は OOM で不安定だったため乗り換え。
      -- 起動バイナリ名は intellij-server（mason が bin に貼るリンク名）。
      --
      -- このビルドは有効期限付きで、切れると起動直後に自死する（gd/gr/gi が無反応に
      -- なる）。検知と更新は config.kotlin_lsp_health に切り出してある。
      local kotlin_health = require("config.kotlin_lsp_health")
      kotlin_health.setup()

      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/intellij-server"
      vim.lsp.config("kotlin_lsp", {
        cmd = { mason_bin, "--stdio" },
        filetypes = { "kotlin" },
        root_markers = {
          "settings.gradle",
          "settings.gradle.kts",
          "build.gradle",
          "build.gradle.kts",
          "pom.xml",
          ".git",
        },
        on_exit = function(code)
          kotlin_health.on_exit(code)
        end,
      })
      vim.lsp.enable("kotlin_lsp")
    end,
  },
})
