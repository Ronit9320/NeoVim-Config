return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 20,  -- Default terminal size
      open_mapping = [[<C-\>]],  -- Keybinding to toggle terminal
      direction = 'horizontal',  -- Terminal direction ('horizontal', 'vertical', 'float', or 'tab')
    }
  end
}

