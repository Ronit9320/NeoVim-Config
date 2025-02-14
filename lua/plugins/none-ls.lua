return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            
            -- Register sources
            null_ls.setup({
                sources = {
                    -- CPPLint configuration
                    -- Additional linters from your installed packages
                    null_ls.builtins.diagnostics.cppcheck,
                    null_ls.builtins.diagnostics.cmake_lint,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.diagnostics.pylint,
                    -- null_ls.builtins.diagnostics.eslint,
                    
                    -- Formatters
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                },
                
                -- Debug settings
                debug = true,
                
                -- Automatically format on save
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    },
    
    -- Make sure cpplint is installed
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "cpplint",
                "clang-format",
                "prettier",
                "black",
                "pylint",
            },
        },
    },
}
