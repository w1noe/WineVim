return {
    {
        "OXY2DEV/markview.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ft = "markdown",
        opts = {
            code_blocks = {
                enable = true,
                style = "rounded",
                hl = "MarkviewCodeBlock",
                language_label = { enable = true },
            },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
            vim.g.mkdp_theme = "dark"
        end,
    },
}
