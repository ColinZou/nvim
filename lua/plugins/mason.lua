return {
  "williamboman/mason.nvim",
  lazy = true,
  config = function()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "roslyn@vv3.7.0-5.20366.1" },
    })
  end,
}
