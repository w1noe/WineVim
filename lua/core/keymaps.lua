--Convention: All the keymap settings in another file, the file path should be added in as a comment.
--At the start of this file
--
--"config.dap_config.dap_ui"

local keymap = vim.keymap

vim.g.mapleader = " "

--Insert mode
keymap.set("i", "jk", "<ESC>")

--Visual mode
--Move the code
keymap.set("v", "J", ":m '>+1<CR>gv=gv",
{ desc = "Move the selected code upward one line" }
)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", 
{ desc = "Move the selected code downward one line" }
)

--Normal mode
--Window
keymap.set("n", "<leader>sv", "<C-w>v",
{ desc = "Split the window in half horizontally."}
)

keymap.set("n", "<leader>sh", "<C-w>s", 
{ desc = "Split the window in half vertically." }
)

keymap.set("n", "<leader>wh", "<C-w>h",
{ desc = "Move to the left window" }
)

keymap.set("n", "<leader>wl", "<C-w>l",
{ desc = "Move to the right window" }
)

--Nvim-tree
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "NvimTree Toggle" })
--
