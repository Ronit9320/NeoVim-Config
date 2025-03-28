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

      -- Lua LSP with LÖVE2D support
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- LÖVE2D uses LuaJIT
            },
            diagnostics = {
              globals = { "love" }, -- Recognize 'love' as a global
            },
            workspace = {
              library = {
                vim.env.HOME .. "/.local/share/love2d-api", -- Path to your cloned love-api
                "${3rd}/love2d/library",                  -- Built-in lua_ls LÖVE2D support
              },
              checkThirdParty = false,                    -- Avoid third-party prompts
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Other LSP setups
      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never", "--completion-style=detailed" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
      })
      lspconfig.pylsp.setup({})
      lspconfig.cmake.setup({})
      lspconfig.marksman.setup({})
      lspconfig.cmake.setup({})

      -- Common LSP keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
      vim.keymap.set("n", "G", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename symbol" })
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
