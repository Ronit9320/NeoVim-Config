return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      -- Create an augroup for formatting
      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      -- Register sources
      null_ls.setup({
        debug = true, -- Enable debug logging
        sources = {
          -- Diagnostics
          null_ls.builtins.diagnostics.cppcheck,
          null_ls.builtins.diagnostics.cmake_lint,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.pylint,
          -- Formatters
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
        },
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

      -- Key mapping to format the current buffer on demand
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), async = true })
      end, { desc = "Format Buffer" })
    end,
  },

  -- Ensure that the following tools are installed via Mason
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
