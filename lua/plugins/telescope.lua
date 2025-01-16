return {
  {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8', -- or use branch = '0.1.x'
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
          local telescope = require("telescope")
          telescope.setup({
              defaults = {
                  mappings = {
                      i = {
                          ["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down
                          ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up
                      },
                  },
              },
          })
      end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      }
    }
    require("telescope").load_extension("ui-select")
    end
  },
}
