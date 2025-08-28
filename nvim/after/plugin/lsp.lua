local lsp = require('lsp-zero').preset({})

-- lsp.ensure_installed({
-- 	-- 'tsserver',
-- 	-- 'eslint',
-- 	'sumneko_lua',
--     'lua_ls',
-- 	-- 'rust_analyzer'
-- })

-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   -- Replace the language servers listed here
--   -- with the ones you want to install
--   ensure_installed = {'lua_ls', 'rust_analyzer'},
--   handlers = {
--     function(server_name)
--       require('lspconfig')[server_name].setup({})
--     end,
--   }
-- })


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Return>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}
  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>prr", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>prf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>prn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>pre", function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set("i", "C-h", function() vim.lsp.buf.signatur_help() end, opts)

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- require('lspconfig').gdscript.setup{
--     on_attach = lsp.on_attach,
--     flags = {
--         debounce_text_changes = 150,
--     }
-- }

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
