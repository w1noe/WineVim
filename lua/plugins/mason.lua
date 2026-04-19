return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", -- Lua
                    "stylua",

                    "pyright", -- Python

                    "clangd", -- C/C++
                },
                automatic_installation = true,
            })
        end,
    },
}
