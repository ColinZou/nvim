return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "moon",
    on_colors = function(colors)
      colors.border = "orange"
    end,
  },
}
