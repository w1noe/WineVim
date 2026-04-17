require("config.dap_config.dap_ui")

if WVimPrefer.cpp_lsp_active then
    require("config.dap_config.dap_cpp")
end

if WVimPrefer.python_lsp_active then
    require("config.dap_config.dap_python")
end
