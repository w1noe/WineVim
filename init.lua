--configuration for winoe
--first code begins at 2026.4.11 00:18
--It's so late right now, and there are damn tests tommorrow :(
--Anyway, lets get started!

print("winoe configuration")

-- Nvim-tree: disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

--Important: -------------------------------
--The global options such as make_transparency are in the configs.preferences file,
--check this out!!!!!
----------------------------------------------

require("config.preferences")
require("core.options")
require("core.keymaps")
require("config.lazy")
require("config.lsp_switcher")

require("config.init_behaviour")

vim.opt.termguicolors = true

