-- Config leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.plugins")

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

local function copy_relative_path()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == "" then
    return
  end

  local relative = vim.fn.fnamemodify(bufname, ":.")

  if relative == "" then
    relative = bufname
  end

  vim.fn.setreg("+", relative)
end

vim.keymap.set("n", "<leader>yf", copy_relative_path)

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})
