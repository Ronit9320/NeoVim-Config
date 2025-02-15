return {
  "tpope/vim-fugitive",
  config = function()
    local map = vim.api.nvim_set_keymap

    -- Normal mode mappings
    map("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
    map("n", "<leader>gd", ":Git diff<CR>", { noremap = true, silent = true })
    map("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
    map("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
    map("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
    map("n", "<leader>gf", ":Git fetch<CR>", { noremap = true, silent = true })
    map("n", "<leader>gg", ":Git log<CR>", { noremap = true, silent = true })
    map("n", "<leader>gco", ":Git checkout<CR>", { noremap = true, silent = true })
    map("n", "<leader>gm", ":Git merge<CR>", { noremap = true, silent = true })
    map("n", "<leader>gr", ":Git rebase<CR>", { noremap = true, silent = true })
    map("n", "<leader>ga", ":Git add .<CR>", { noremap = true, silent = true })
    map("n", "<leader>gu", ":Git update-index -assume-unchanged %<CR>", { noremap = true, silent = true })
    map("n", "<leader>gU", ":Git update-index --no-assume-unchanged %<CR>", { noremap = true, silent = true })

    -- Visual mode mappings
    map("v", "<leader>gs", ":<C-U>Git add %:.<CR>", { noremap = true, silent = true })

    -- Command-line mappings
    -- Replace '-complete=shell' with '-complete=shellcmd' or remove completion entirely
    vim.cmd([[
      command! -nargs=* -complete=shellcmd GitSplit vsplit | term git <args>
    ]])

    -- Fugitive settings (optional)
    vim.g.fugitive_git_executable = "git"
    -- vim.g.fugitive_diff_options = "--word-diff"

    -- Make sure you have set your <leader> key before this file is loaded
    -- e.g., vim.g.mapleader = " "
  end,
}

