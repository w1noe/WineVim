local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.relativenumber = true
opt.shiftwidth = 4

--System clipboard
opt.clipboard:append("unnamedplus")

--Default new splited window
opt.splitright = true
opt.splitbelow = true

--Search
opt.ignorecase = true
opt.smartcase = true

--Display
opt.termguicolors = true
opt.signcolumn = "yes" 

if WVimPrefer.tab_to_spaces then
    opt.expandtab = true
end


