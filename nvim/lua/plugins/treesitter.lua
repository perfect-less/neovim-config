return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
    local configs = require("nvim-treesitter.config")

    configs.setup({
      -- A list of parser names, or "all"
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = {
        enable = true
      },
    })
  end
}
