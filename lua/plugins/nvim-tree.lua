return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            {
                "<leader>wx",
                function()
                    local api = require("nvim-tree.api")
                    local node = api.tree.get_node_under_cursor()

                    -- 如果选中的是文件夹，就打开它；否则打开它的上级目录
                    local path = node.fs_type == "directory" and node.absolute_path
                        or vim.fn.fnamemodify(node.absolute_path, ":h")

                    -- 跨平台打开系统文件管理器
                    if vim.fn.has("win32") == 1 then
                        vim.fn.system(string.format('start "" "%s"', path))
                    elseif vim.fn.has("mac") == 1 then
                        vim.fn.system(string.format('open "%s"', path))
                    else
                        vim.fn.system(string.format('xdg-open "%s"', path))
                    end
                end,
                desc = "Open current folder in system explorer",
            },
        },
    },
}
