return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-tree.lua" },

    config = function()
        local dashboard = require("dashboard")
        local function get_startup_time()
            local ok, stats = pcall(require, "lazy.stats")
            if not ok then
                return "~ ms"
            end

            local s = stats.stats()
            local ms = s.times.UIEnter or s.times.LazyDone or 99

            return string.format("%.2f ms", ms)
        end

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
                            require("telescope.builtin").oldfiles({
                                attach_mappings = function(_, map)
                                    local function open_file(prompt_bufnr)
                                        local actions = require("telescope.actions")
                                        local state = require("telescope.actions.state")
                                        local path = state.get_selected_entry().value
                                        actions.close(prompt_bufnr)

                                        -- 打开文件
                                        vim.cmd.edit(vim.fn.fnameescape(path))

                                        -- 打开 tree 并定位，但光标**不跳过去**
                                        vim.defer_fn(function()
                                            local ok, api = pcall(require, "nvim-tree.api")
                                            if ok then
                                                api.tree.open()
                                                api.tree.find_file({ open = false, focus = false })
                                                -- 强制回到编辑窗口
                                                vim.cmd.wincmd("w")
                                            end
                                        end, 50)
                                    end
                                    map("i", "<CR>", open_file)
                                    map("n", "<CR>", open_file)
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
                recent_files = { enable = false },
                footer = {
                    "Ready to code! Another good day, winoe! ",
                    "",
                    "",
                    "",
                    "🚀 Startup Time [" .. get_startup_time() .. "]",
                },

                ui = {
                    header = { align = "center" },
                    center = { align = "center" },
                    footer = { align = "center" },
                },
            },
        })
    end,

    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        {
            "dstein64/vim-startuptime",
            cmd = "StartupTime",
            init = function()
                vim.g.startuptime_use_nested = 0
            end,
        },
    },
}
