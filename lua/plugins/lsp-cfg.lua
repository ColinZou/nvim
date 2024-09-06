if vim.g.autoformat == false then
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        autoformat = false,
      },
    },
  }
end
