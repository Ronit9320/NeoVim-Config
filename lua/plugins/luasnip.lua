return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",    },
  config = function()
    local luasnip = require("luasnip")

    -- Set up LuaSnip configuration
    luasnip.config.set_config({
      history = true,                   -- Keep around last snippet for jump back
      updateevents = "TextChanged,TextChangedI", -- Update changes as you type
      enable_autosnippets = true,       -- Enable automatic snippet expansion
    })

    -- Load snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Optional: Load custom snippets if you have them
    -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
  end,
}

