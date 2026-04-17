local dap, dapui = require("dap"), require("dapui")

-- 初始化 UI
dapui.setup()

-- 自动打开/关闭 UI（调试启动时自动开，结束自动关）
dap.listeners.after.event_initialized["dapui_config"] = function()
    if WVimPrefer.close_file_tree_before_debug then
	require("nvim-tree.api").tree.close()
    end
    dapui.open()
end

vim.keymap.set("n", "<leader>du", function()
    dapui.close()
    if WVimPrefer.open_file_tree_after_debug then
	require("nvim-tree.api").tree.open()
    end
end,
{desc = "Close dap ui"})
