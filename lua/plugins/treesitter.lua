return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.10.0",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        -- 开启高亮（核心）
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- 关闭旧高亮，防止冲突
        },

        -- 自动安装这些语言解析器（lua + python 必加）
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",  -- 👈 加上这个，Python 高亮立刻正常
        },

        -- 开启自动缩进（Python 非常需要）
        indent = { enable = true },
    },
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
