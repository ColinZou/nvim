return {
  "mason-org/mason.nvim",
  lazy = true,
  opt = {},
  config = function()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })
  end,
}
