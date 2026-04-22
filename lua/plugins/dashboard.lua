return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    config = function()
        local dashboard = require("dashboard")
        dashboard.setup({
            theme = "doom",
            config = {
                header = {
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    [[ _       ___          _    ___         ]],
                    [[| |     / (_)___  ___| |  / (_)___ ___ ]],
                    [[| | /| / / / __ \/ _ \ | / / / __ `__ \]],
                    [[| |/ |/ / / / / /  __/ |/ / / / / / / /]],
                    [[|__/|__/_/_/ /_/\___/|___/_/_/ /_/ /_/ ]],
                    "",
                    "  Winoe's configuration for neovim.",
                    "",
                    "",
                    "",
                    "",
                },

                center = {
                    {
                        icon = "  ",
                        desc = "Open Config Dir  ",
                        key = "o",
                        action = function()
                            local config_path = vim.fn.stdpath("config")
                            -- 先临时切换 CWD → 打开 nvim-tree → 自动同步
                            vim.cmd("cd " .. config_path)
                            require("nvim-tree.api").tree.open()
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "New File         ",
                        key = "n",
                        action = "enew",
                    },
                    {
                        icon = "  ",
                        desc = "Find File        ",
                        key = "f",
                        action = function()
                            if pcall(require, "telescope") then
                                require("telescope.builtin").find_files()
                            else
                                vim.cmd("echo 'Telescope not installed!'")
                            end
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "Recent Files     ",
                        key = "r",
                        action = function()
                            if not pcall(require, "telescope") then
                                vim.cmd("echo 'Telescope not installed!'")
                                return
                            end

                            require("telescope.builtin").oldfiles({
                                attach_mappings = function(_, map)
                                    local function open_file(prompt_bufnr)
                                        local action_state = require("telescope.actions.state")
                                        local selected_entry = action_state.get_selected_entry()
                                        require("telescope.actions").close(prompt_bufnr)

                                        if selected_entry then
                                            local file_path = selected_entry.value
                                            vim.cmd("edit " .. vim.fn.fnameescape(file_path))

                                            -- 🔥 修复：改用 api 打开，不用命令行，彻底解决 Windows 路径报错
                                            vim.defer_fn(function()
                                                local ok, api = pcall(require, "nvim-tree.api")
                                                if ok then
                                                    local dir_path = vim.fn.fnamemodify(file_path, ":h")
                                                    api.tree.open({ path = dir_path })
                                                    api.tree.find_file({ focus = false })
                                                end
                                            end, 30)
                                        end
                                    end

                                    map("n", "<CR>", open_file)
                                    map("i", "<CR>", open_file)
                                    return true
                                end,
                            })
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "Open Project     ",
                        key = "p",
                        action = function()
                            require("nvim-tree.api").tree.open()
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "Quit Neovim      ",
                        key = "q",
                        action = "qa",
                    },
                },
                center_vertical = false,
                footer = { "🚀 Ready to code! Another good day, winoe! " },
                recent_files = { enable = false },
            },
            ui = {
                header = { align = "center" },
                center = { align = "center" },
                footer = { align = "center" },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
