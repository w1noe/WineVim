if preferences.lua_lsp_active then
    vim.lsp.enable("lua_ls")
end

if preferences.python_lsp_active then
    vim.lsp.enable("pyright")
end

if preferences.cpp_lsp_active then
    vim.lsp.enable("clangd")
end
