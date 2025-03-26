require("config.lazy")
require("config.lualine")
require("config.lua_ls")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true, desc = "Save and Close current window" })
vim.keymap.set("n", "<leader>wt", ":w<CR>", { noremap = true, silent = true, desc = "Save current window" })
vim.keymap.set("n", "<leader>qu", ":q<CR>", { noremap = true, silent = true, desc = "Close current window" })
vim.keymap.set("n", "<leader>qf", ":q!<CR>", { noremap = true, silent = true, desc = "Close current window wihout changes" })

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true

vim.opt.number = true
vim.opt.relativenumber = true
