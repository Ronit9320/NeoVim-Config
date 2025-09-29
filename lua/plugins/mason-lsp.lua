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
          "marksman",
          "ts_ls",
          "cssls",
          "jsonls",
          "eslint",
          "emmet_ls",
          "tailwindcss",
        },
      })
    end,
  },
   {
     "neovim/nvim-lspconfig",
     config = function()
       -- Custom configurations using vim.lsp.config
       vim.lsp.config('lua_ls', {
         settings = {
           Lua = {
             runtime = {
               version = "LuaJIT",
             },
             diagnostics = {
               globals = { "love" },
             },
             workspace = {
               library = {
                 vim.env.HOME .. "/.local/share/love2d-api",
                 "${3rd}/love2d/library",
               },
               checkThirdParty = false,
             },
             telemetry = {
               enable = false,
             },
           },
         },
       })

       vim.lsp.config('clangd', {
         cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never", "--completion-style=detailed" },
         filetypes = { "c", "cpp", "objc", "objcpp" },
         root_dir = vim.fs.root(0, { "compile_commands.json", ".git" }),
       })

       vim.lsp.config('emmet_ls', {
         filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" }
       })

       -- Keymaps and handlers
       vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
       vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
       vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
       vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename symbol" })
       vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
       vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
       vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

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
