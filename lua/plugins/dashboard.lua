return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
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
                            vim.cmd("NvimTreeOpen " .. config_path)
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
                        icon = "  ",
                        desc = "Recent Projects  ",
                        key = "r",
                        -- 点击 / 按 r 后执行的函数
                        action = function()
                            -- 1. 检查是否安装了 telescope，没安装直接提示
                            local telescope_ok, _ = pcall(require, "telescope")
                            if not telescope_ok then
                                vim.notify("Telescope 未安装！", 3)
                                return
                            end

                            -- 2. 读取 neovim 自带的“最近打开的文件列表”
                            --    从这个列表里 提取出所有文件夹（去重 + 只保留存在的文件夹）
                            local dirs = {} -- 最终要显示的文件夹列表
                            local seen = {} -- 去重使用（记录已经加过的文件夹）

                            -- 遍历所有最近打开过的文件
                            for _, file_path in ipairs(vim.v.oldfiles or {}) do
                                -- 过滤空路径
                                if file_path == "" then
                                    goto continue
                                end

                                -- 3. 把文件路径 → 转换成所在文件夹路径
                                --    :h 就是 head 的意思，自动去掉文件名，只留目录
                                local folder_path = vim.fn.fnamemodify(file_path, ":h")

                                -- 4. 判断这个文件夹是否真实存在，并且没有加过
                                if vim.fn.isdirectory(folder_path) == 1 and not seen[folder_path] then
                                    seen[folder_path] = true -- 标记为已添加
                                    table.insert(dirs, folder_path) -- 加入列表
                                end

                                ::continue::
                            end

                            -- 5. 如果没有最近文件夹，提示并退出
                            if #dirs == 0 then
                                vim.notify("暂无最近打开的项目", 2)
                                return
                            end

                            -- 6. 用 telescope 展示文件夹选择列表
                            local pickers = require("telescope.pickers")
                            local finders = require("telescope.finders")
                            local conf = require("telescope.config").values
                            local actions = require("telescope.actions")
                            local action_state = require("telescope.actions.state")

                            pickers
                                .new({}, {
                                    prompt_title = "Recent Projects",
                                    -- 显示的内容：就是我们提取的文件夹列表
                                    finder = finders.new_table({ results = dirs }),
                                    -- 排序（telescope 默认排序）
                                    sorter = conf.generic_sorter({}),

                                    -- 按键绑定
                                    attach_mappings = function(_, map)
                                        -- 回车 执行的动作
                                        map("i", "<CR>", function(bufnr)
                                            -- 7. 获取你选中的文件夹路径
                                            local selected_entry = action_state.get_selected_entry()
                                            local target_folder = selected_entry.value

                                            -- 8. 关闭 telescope 窗口
                                            actions.close(bufnr)

                                            -- ==============================================
                                            -- 🔥 下面是核心：打开 NvimTree 到 target_folder
                                            -- 你只需要改这里！
                                            -- ==============================================

                                            -- 第一步：切换 neovim 的工作目录到选中的文件夹
                                            vim.cmd("cd " .. target_folder)

                                            -- 第二步：关闭旧的 nvim-tree
                                            pcall(function()
                                                require("nvim-tree.api").tree.close()
                                            end)
                                            vim.cmd("NvimTreeClose")

                                            -- 第三步：延迟 50 毫秒，再打开新目录
                                            -- （必须延迟，否则目录还没切换完）
                                            vim.defer_fn(function()
                                                -- 方法 A：用 API 打开（推荐，稳定）
                                                local nvim_tree_api_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
                                                if nvim_tree_api_ok then
                                                    nvim_tree_api.tree.open({ path = target_folder })
                                                end

                                                -- 方法 B：用命令打开（兜底，双保险）
                                                vim.cmd("NvimTreeOpen " .. target_folder)
                                            end, 50)
                                        end)

                                        return true
                                    end,
                                })
                                :find()
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "Recent Files     ",
                        key = "b",
                        action = function()
                            if pcall(require, "telescope") then
                                require("telescope.builtin").oldfiles()
                            else
                                vim.cmd("echo 'Telescope not installed!'")
                            end
                        end,
                    },
                    {
                        icon = "  ",
                        desc = "Open Project     ",
                        key = "p",
                        action = "NvimTreeOpen .",
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
