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
				ensure_installed = { "lua_ls", "omnisharp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})

			-- Set up common key mappings for LSP features
			-- Hover documentation
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			-- Go-to-definition mapping
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})

			-- Code actions
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
