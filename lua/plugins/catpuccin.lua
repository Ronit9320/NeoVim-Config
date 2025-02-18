return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- Choose flavor based on black and white blackhole wallpaper
      flavour = "mocha",

      -- Enable transparency
      transparent_background = true,

      -- Term colors
      term_colors = true,

      -- Styles
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },

      -- Custom highlights for transparency
      custom_highlights = {
        Normal = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { fg = "#89b4fa", bg = "NONE" },
        ColorColumn = { bg = "NONE" },
        CursorLine = { bg = "NONE" },
        VertSplit = { fg = "#6e738d", bg = "NONE" },
        SignColumn = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        LineNr = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        DiagnosticVirtualTextError = { bg = "NONE" },
        DiagnosticVirtualTextWarn = { bg = "NONE" },
        DiagnosticVirtualTextInfo = { bg = "NONE" },
        DiagnosticVirtualTextHint = { bg = "NONE" },
        TelescopeNormal = { bg = "NONE" },
        TelescopeBorder = { bg = "NONE" },
      },

      -- Integration settings
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = true,
        telescope = true,
        native_lsp = {
          enabled = true,
        },
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
      },
    })

    -- Set colorscheme after options
    vim.cmd.colorscheme("catppuccin")

    -- Additional commands to ensure transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
  end
}
