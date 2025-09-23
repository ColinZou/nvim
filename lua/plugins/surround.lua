return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    -- Configuration goes here.
    require("nvim-surround").setup({})
  end,
  dependencies = { "nvim-treesitter/nvim-treesitter", "mason-org/mason.nvim" },
}
