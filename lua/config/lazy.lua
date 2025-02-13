local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
-- setup helm-ls
lspconfig.helm_ls.setup({
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
  capabilities = lsp_capabilities,
})
lspconfig.yamlls.setup({
  capabilities = lsp_capabilities,
})

local omnisharp_bin = os.getenv("OMNISHARP_BIN")
if omnisharp_bin == nil then
  -- setup omnisharp
  omnisharp_bin = os.getenv("HOME") .. "/bin/omnisharp/OmniSharp.dll"
end
local dotnet_bin = os.getenv("DOTNET_BIN")
if dotnet_bin == nil then
  -- setup dotnet
  dotnet_bin = "dotnet"
end
-- setup omnisharp
--lspconfig["omnisharp"].setup({
--  on_attach = function(client, bufnr)
--    local large_project_mode = os.getenv("NVIM_HUGE_CSHARP_PROJ")
--    if not large_project_mode == nil then
--      -- Disable highlighting as it can be slow
--      client.server_capabilities.semanticTokensProvider = nil
--    end
--  end,
--  cmd = {
--    dotnet_bin,
--    omnisharp_bin,
--  },
--  capabilities = lsp_capabilities,
--})
