vim.g.mapleader= " "
vim.keymap.set("n", "<leader>pe", vim.cmd.Explore)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })
vim.keymap.set('n', '<leader>pr', vim.lsp.buf.rename, { desc = 'LSP Rename' })

-- copy/paste to/from system clipboard
vim.keymap.set({"n", "x"}, "<leader>cp", '"+y')
vim.keymap.set({"n", "x"}, "<leader>cv", '"+p')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv'")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "Y", "yg$")
-- vim.keymap.set("n", "Y", "yg$")
-- vim.keymap.set("n", "Y", "yg$")


vim.keymap.set("n", "<leader>pl", function ()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled(), nil)
end)
vim.keymap.set("n", "<leader>pk", function ()
    vim.diagnostic.open_float()
end)
