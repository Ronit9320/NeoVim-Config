return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = {
				ours = "co",
				theirs = "ct",
				none = "c0",
				both = "cb",
				next = "]x",
				prev = "[x",
			},
			disable_diagnostics = true,
			highlights = {
				incoming = "DiffText",
				current = "DiffAdd",
			},
		})
	end,
}
