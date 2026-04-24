-- return {
--     "CRAG666/betterTerm.nvim",
--     opts = {
--         -- your options
--     },
--     config = function()
--         local betterTerm = require("betterTerm")
--
--         -- Toggle the first terminal (ID defaults to index_base, which is 0)
--         vim.keymap.set({ "n", "t" }, "<leader>nt", function()
--             betterTerm.open()
--         end, { desc = "Toggle terminal" })
--
--         -- Open a specific terminal
--         vim.keymap.set({ "n", "t" }, "<C-/>", function()
--             betterTerm.open(1)
--         end, { desc = "Toggle terminal 1" })
--
--         -- Cycle to the right
--         vim.keymap.set({ "n", "t" }, "<C-PageUp>", function()
--             betterTerm.cycle(1)
--         end, { desc = "Cycle terminals to the right" })
--
--         -- Cycle to the left
--         vim.keymap.set({ "n", "t" }, "<C-PageDown>", function()
--             betterTerm.cycle(-1)
--         end, { desc = "Cycle terminals to the left" })
--
--         -- Select a terminal to focus
--         vim.keymap.set("n", "<leader>tt", betterTerm.select, { desc = "Select terminal" })
--
--         -- Rename the current terminal
--         vim.keymap.set("n", "<leader>tr", betterTerm.rename, { desc = "Rename terminal" })
--
--         -- Toggle the tabs bar
--         vim.keymap.set("n", "<leader>tb", betterTerm.toggle_tabs, { desc = "Toggle terminal tabs" })
--
--         betterTerm.setup({
--             prefix = "CRAG",
--             startInserted = false,
--             position = "right",
--             size = 80,
--             jump_tab_mapping = "<A-$tab>", -- Alt+1, Alt+2, ...
--             predefined = {
--                 { index = 0, name = "Main" },
--                 { index = 1, name = "Server" },
--                 { index = 2, name = "Tests" },
--             },
--         })
--     end,
-- }
--
return {
    "s1n7ax/nvim-terminal",
    config = function()
        vim.o.hidden = true

        require("nvim-terminal").setup({
            window = {
                -- Do `:h :botright` for more information
                -- NOTE: width or height may not be applied in some "pos"
                position = "botright",

                -- Do `:h split` for more information
                split = "sp",

                -- Width of the terminal
                width = 50,

                -- Height of the terminal
                height = 15,
            },

            -- keymap to disable all the default keymaps
            disable_default_keymaps = false,

            -- keymap to toggle open and close terminal window
            toggle_keymap = "<leader>;",

            -- increase the window height by when you hit the keymap
            window_height_change_amount = 2,

            -- increase the window width by when you hit the keymap
            window_width_change_amount = 2,

            -- keymap to increase the window width
            increase_width_keymap = "<leader><leader>+",

            -- keymap to decrease the window width
            decrease_width_keymap = "<leader><leader>-",

            -- keymap to increase the window height
            increase_height_keymap = "<leader>+",

            -- keymap to decrease the window height
            decrease_height_keymap = "<leader>-",

            terminals = {
                -- keymaps to open nth terminal
                { keymap = "<leader>1" },
                { keymap = "<leader>2" },
                { keymap = "<leader>3" },
                { keymap = "<leader>4" },
                { keymap = "<leader>5" },
            },
        })
    end,
}
