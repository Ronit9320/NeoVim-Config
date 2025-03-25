return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      null_ls.setup({
        debug = true,
        sources = {
          -- Diagnostics
          null_ls.builtins.diagnostics.cppcheck,
          null_ls.builtins.diagnostics.cmake_lint,
          null_ls.builtins.diagnostics.markdownlint,
          -- null_ls.builtins.diagnostics.flake8,
          -- Formatters
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
        },

        -- Auto-format on save
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false }) -- Force sync formatting
              end,
            })
          end
        end,
      })

      -- Keymap for manual formatting
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), async = false })
      end, { desc = "Format Buffer" })
    end,
  },

  -- Mason ensures tools are installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "cppcheck",
        "clang-format",
        "prettier",
        "black",
        "flake8",
      },

    },
  },

  -- Mason integration for none-ls
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "cppcheck",
          "clang-format",
          "prettier",
          "black",
          "flake8",
        },
        automatic_setup = true,
      })
    end,
  },
}
