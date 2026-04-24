-- return {
--     dir = [[D:\Projects\Lua\NeovimPlugins\WineC]],
--     name = "WineC",
--     config = function()
--         require("quick-c").setup({
--             compile_commands = {
--                 find_dir = "ninja-build",
--             },
--             vim.keymap.set("n", "<leader>cqG", function()
--                 vim.cmd("QuickCCompileDBGenCMake")
--             end, { desc = "Quick-c: Gen compile_commands.json and copy that to source." }),
--         })
--     end,
-- }

return {
    {
        "w1noe/WineC",

        lazy = true,
        event = "VeryLazy",

        -- 1) 文件类型触发（打开 C/C++ 文件时加载）
        ft = { "c", "cpp" },
        -- 2) 快捷键触发（首次按键时加载，映射由插件在 setup 时注入）
        keys = {
            { "<leader>cqb", desc = "Quick-c: Build" },
            { "<leader>cqr", desc = "Quick-c: Run" },
            { "<leader>cqR", desc = "Quick-c: Build & Run" },
            { "<leader>cqD", desc = "Quick-c: Debug" },
            { "<leader>cqM", desc = "Quick-c: Make targets (Telescope)" },
            { "<leader>cqS", desc = "Quick-c: Select sources (Telescope)" }, -- 使用tab进行多选
            { "<leader>cqf", desc = "Quick-c: Open quickfix (Telescope)" },
            { "<leader>cqL", desc = "Quick-c: Build logs (Telescope)" },
            { "<leader>cqC", desc = "Quick-c: CMake targets (Telescope)" },
            { "<leader>cqB", desc = "Quick-c: CMake build" },
            { "<leader>cqc", desc = "Quick-c: CMake configure" },
            { "<leader>cqx", desc = "Quick-c: Stop current task" },
            { "<leader>cqt", desc = "Quick-c: Retry last task" },
        },
        -- 3) 命令触发（调用命令时加载，等同“命令提前加载”）
        cmd = {
            "QuickCBuild",
            "QuickCRun",
            "QuickCBR",
            "QuickCDebug",
            "QuickCMake",
            "QuickCMakeRun",
            "QuickCMakeCmd",
            "QuickCCMake",
            "QuickCCMakeRun",
            "QuickCCMakeConfigure",
            "QuickCCompileDB",
            "QuickCCompileDBGen",
            "QuickCCompileDBUse",
            "QuickCQuickfix",
            "QuickCCheck",
        },
        config = function()
            require("quick-c").setup({
                compile_commands = {
                    find_dir = "ninja-build",
                },
                vim.keymap.set("n", "<leader>cqG", function()
                    vim.cmd("QuickCCompileDBGenCMake")
                end, { desc = "Quick-c: Gen compile_commands.json & copy that to source." }),
            })
        end,
    },
}
