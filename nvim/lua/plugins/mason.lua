return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
        ensure_installed = {
            "debugpy", -- Python Debugger
            "ruff",    -- Fast Python linter/formatter
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local mr = require("mason-registry")
        for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
                p:install()
            end
        end
    end,
}
