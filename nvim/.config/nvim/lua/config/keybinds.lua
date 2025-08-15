vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Neo-tree
vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal right<CR>", { noremap = true, silent = true })
