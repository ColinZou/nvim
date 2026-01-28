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
vim.wo.relativenumber = true
local zellij_flag = os.getenv("ZELLIJ")
if nil == zellij_flag then
  vim.api.nvim_set_option_value("clipboard", "unnamedplus", { scope = "global" })
else
  vim.g.clipboard = "unnamedplus"
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
      local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
      copy_to_unnamedplus(vim.v.event.regcontents)
      local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
      copy_to_unnamed(vim.v.event.regcontents)
    end,
  })
end
vim.g.lazyvim_picker = "telescope"
