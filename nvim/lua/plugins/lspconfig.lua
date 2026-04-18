return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- We still use mason-lspconfig to ensure binaries are mapped
    require("mason-lspconfig").setup({
      -- ensure_installed = { "pyright" },
    })

    -- NEW 0.12+ APPROACH: Use vim.lsp.config instead of require('lspconfig')
    -- This removes the deprecation warning
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup Pyright
    -- vim.lsp.config("pyright", {
    --   install = function()
    --     -- Tells Neovim to use the Mason-installed binary
    --     require("mason-lspconfig").setup_handlers({
    --       function(server_name)
    --         require("lspconfig")[server_name].setup({
    --           capabilities = capabilities,
    --         })
    --       end,
    --     })
    --   end,
    --   -- Standard LSP settings now go here
    --   options = {
    --     settings = {
    --       python = {
    --         analysis = {
    --           autoSearchPaths = true,
    --           useLibraryCodeForTypes = true,
    --           diagnosticMode = "workspace",
    --         },
    --       },
    --     },
    --   },
    -- })
    --
    -- -- Enable the config
    -- vim.lsp.enable("pyright")
  end,
}
