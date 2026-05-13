if WVimPrefer.lua_lsp_active then
    vim.lsp.enable("lua_ls")
end

if WVimPrefer.python_lsp_active then
    vim.lsp.enable("pyright")
end

if WVimPrefer.cpp_lsp_active then
    vim.lsp.enable("clangd")
end

if WVimPrefer.rust_lsp_active then
    vim.lsp.enable("rust_analyzer")
end
