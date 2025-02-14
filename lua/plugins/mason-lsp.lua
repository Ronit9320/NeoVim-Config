 return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pylsp",
                    "ast_grep",
                    "cmake",
                    "html",
                    "marksman", -- for markdown
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            
            -- Lua
            lspconfig.lua_ls.setup({})
            
            -- C/C++
            lspconfig.clangd.setup({})
            
            -- Python
            lspconfig.pylsp.setup({})
            
            -- HTML
            lspconfig.html.setup({})
            
            -- CMake
            lspconfig.cmake.setup({})
            
            -- Markdown
            lspconfig.marksman.setup({})
            
            -- Common LSP keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
            
            -- LSP handlers configuration
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = "rounded",
                }
            )
            
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = "rounded",
                }
            )
        end,
    },
}
