return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,

      highlight = {
        enable = true,                             -- Enable Tree-sitter-based syntax highlighting
        additional_vim_regex_highlighting = false, -- Disable legacy Vim regex highlighting
      },
      indent = {
        enable = true, -- Enable automatic indentation
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",    -- Start selection
          node_incremental = "grn",  -- Increment selection to the next node
          scope_incremental = "grc", -- Increment selection to the next scope
          node_decremental = "grm",  -- Decrement selection
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,             -- Automatically jump forward to textobj
          keymaps = {
            ["af"] = "@function.outer", -- Select around a function
            ["if"] = "@function.inner", -- Select inside a function
            ["ac"] = "@class.outer",    -- Select around a class
            ["ic"] = "@class.inner",    -- Select inside a class
          },
        },
      },
    })
  end,
}
