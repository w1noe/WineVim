function make_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
end

return{
    -- the colorscheme should be available when starting Neovim
    {
	"folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
	vim.cmd([[colorscheme tokyonight]])
	if preferences.transparent then
	    make_transparency()
	end
	end,
    },
}
