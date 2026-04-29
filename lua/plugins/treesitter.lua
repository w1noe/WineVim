return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- 关闭旧高亮，防止冲突
        },

        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",
        },

        indent = { enable = true },
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = true, 
        })
    end,
}

--
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     lazy = false,
--     main = "nvim-treesitter",  -- 关键修复
--     opts = {
--         highlight = {
--             enable = true,
--             additional_vim_regex_highlighting = false,
--         },
--         indent = { enable = true },
--         ensure_installed = { "python", "lua", "vim", "vimdoc" },
--         auto_install = true,
--     },
-- }
