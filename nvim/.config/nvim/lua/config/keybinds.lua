vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Neo-tree
-- vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal right<CR>", { noremap = true, silent = true })

-- Navigate vim panels better
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", {})

-- -- Navigate better in Terminal mode
-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	local map = vim.api.nvim_buf_set_keymap
	map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	map(0, "t", "jk", [[<C-\><C-n>]], opts)
	map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		pcall(set_terminal_keymaps) -- no crash even if buffer invalid
	end,
})
