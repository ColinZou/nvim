-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if vim.g.autoformat == false then
  vim.keymap.del("v", "<leader>cf")
  vim.keymap.set("v", "<leader>cf", vim.lsp.buf.format, { silent = true, noremap = true })
end
