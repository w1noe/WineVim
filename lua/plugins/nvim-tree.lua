return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            require("nvim-tree").setup({
                -- -- 1. 让 nvim-tree 根目录自动同步 Neovim 全局 CWD
                sync_root_with_cwd = true,
                -- -- 2. 尊重当前 buffer 的本地 CWD（lcd/tcd）
                respect_buf_cwd = true,

                -- 3. 在 nvim-tree 里切换目录时，自动更新 Neovim 全局 CWD
                actions = {
                    change_dir = {
                        enable = true,
                        global = true, -- 关键：用 :cd 而非 :lcd，全局生效
                        restrict_above_cwd = false,
                    },
                },

                -- 4. 打开文件时自动定位并更新 CWD（可选但实用）
                update_focused_file = {
                    enable = true,
                    update_cwd = true, -- 切换到文件所在目录
                    ignore_list = {},
                },
            })
        end,

        -- 你原来的系统打开快捷键 完全保留
        keys = {
            {
                "<leader>wx",
                function()
                    local api = require("nvim-tree.api")
                    local node = api.tree.get_node_under_cursor()

                    -- 跳过无效节点（如 ..、--Deleted-- 等）
                    if not node or node.name == ".." or node.name == "--Deleted--" then
                        vim.notify("无效节点，无法打开", vim.log.levels.WARN)
                        return
                    end

                    local path = node.fs_type == "directory" and node.absolute_path
                        or vim.fn.fnamemodify(node.absolute_path, ":h")

                    -- Windows
                    if vim.fn.has("win32") == 1 then
                        vim.fn.system(string.format([[powershell start "%s"]], path))
                    -- Linux / macOS
                    else
                        vim.fn.system(string.format('xdg-open "%s"', path))
                    end
                end,
                desc = "Open in system explorer",
            },
        },
    },
}
