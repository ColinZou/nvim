-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.bomb = false
local disable_format = os.getenv("NVIM_DISABLE_AUTO_FORMAT")
if not (disable_format == nil) then
  vim.g.autoformat = false
end
vim.g.shfmt_fmt_on_save = 0
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false
vim.api.nvim_set_option("clipboard", "unnamed")
