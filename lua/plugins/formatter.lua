return {
    "mhartington/formatter.nvim",
    config = function()
        local util = require("formatter.util")
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                -- Lua: stylua
                lua = {
                    function()
                        return {
                            exe = "stylua",
                            args = {
                                "--indent-width",
                                "4", -- 这里改成你想要的缩进
                                "--indent-type",
                                "Spaces",
                                "--",
                                "-",
                            },
                            stdin = true,
                        }
                    end,
                },
                -- Python: black
                python = {
                    require("formatter.filetypes.python").black,
                },
                -- C/C++: clang-format
                cpp = {
                    require("formatter.filetypes.cpp").clangformat,
                },
                -- JavaScript/TypeScript: prettier
                javascript = {
                    require("formatter.filetypes.javascript").prettier,
                },
                -- 通用：去除行尾空格
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
            },
        })
    end,
}
