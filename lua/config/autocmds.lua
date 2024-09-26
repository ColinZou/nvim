-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.yaml",
    "*.yml",
    "yaml",
    "*.js",
    "*.json",
    "json",
    "*.md",
    "markdown",
    "*.text",
    "text",
  },
  callback = function()
    vim.cmd("set nobomb")
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*", "*.*" },
  callback = function()
    if vim.g.autoformat == false then
      local buf = vim.api.nvim_get_current_buf()
      if (buf == nil) or (buf == 0) then
        return
      end
      vim.b.autoformat = false
      vim.b[buf].autoformat = false
    end
  end,
})
