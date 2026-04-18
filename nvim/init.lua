require("config.lazy")
require("perfectless")

-- vim.lsp.enable({
--     "luals",
--     "python-lsp-server"
-- })


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
