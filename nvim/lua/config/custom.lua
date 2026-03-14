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
