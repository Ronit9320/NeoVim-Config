return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Recommended for file icons
    "MunifTanjim/nui.nvim",        -- Required for Neo-tree UI
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it's the last window
      enable_git_status = true,    -- Enable git status integration
      enable_diagnostics = true,   -- Show diagnostics in the file explorer
      window = {
        width = 25,                -- Set the desired width of the NeoTree window (adjust this number)
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>r", ":Neotree focus<CR>", { noremap = true, silent = true })
  end,
}
