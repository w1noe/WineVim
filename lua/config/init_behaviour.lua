--Display the diagnostic
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
})

--Init python enviroment
---------------

--Bufferline
require("bufferline").setup({})
--

--Disable the neovim terminal
if WVimPrefer.disable_the_defualt_terminal then
    vim.cmd.cnoreabbrev("terminal", 'lua vim.notify("The built-in terminal has been disabled. To open it, see config.preferences. You can use leader_key+1 to open a terminal instead. ") ')
    vim.cmd.cnoreabbrev("term", 'lua vim.notify("The built-in terminal has been disabled. To open it, see config.preferences. You can use leader_key+1 to open a terminal instead.')

    vim.api.nvim_open_term = function()
        vim.notify("The terminal has been disabled", vim.log.levels.error)
    end

    vim.fn.terminal = function()
        vim.notify("The terminal has been disabled", vim.log.levels.error)
    end
end
---------------------------


--Mason config
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "clangd" },
    automatic_installation = true,
})
--
