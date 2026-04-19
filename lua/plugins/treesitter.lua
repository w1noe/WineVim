return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.10.0",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        ensure_installed = { "lua", "vim", "vimdoc" },
    },
}
