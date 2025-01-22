return {
  -- Bufferline configuration
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          offsets = { {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
            padding = 0.9,
          } },
          -- Other bufferline options
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
        }
      })
    end,
  },
}
