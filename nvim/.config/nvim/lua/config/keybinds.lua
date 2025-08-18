vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Neo-tree
vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal right<CR>", { noremap = true, silent = true })

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
