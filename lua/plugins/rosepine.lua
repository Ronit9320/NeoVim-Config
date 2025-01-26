return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      --- Enable transparency
      disable_background = true,
      disable_float_background = true,

      --- Optional: Customize specific groups
      highlight_groups = {
        ColorColumn = { bg = "none" },
        CursorLine = { bg = "none" },
        VertSplit = { fg = "muted", bg = "none" },
      }
    })

    vim.cmd.colorscheme("rose-pine")
  end
}
