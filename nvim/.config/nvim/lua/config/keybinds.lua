vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Navigate vim panels better
vim.keymap.set("n", "<leader>h", "<Cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<leader>j", "<Cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<leader>k", "<Cmd>wincmd k<CR>", {})
vim.keymap.set("n", "<leader>l", "<Cmd>wincmd l<CR>", {})

-- Nevigate better in terminal mode
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	local map = vim.api.nvim_buf_set_keymap
	map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	map(0, "t", "<leader>h", [[<C-\><C-n><C-W>h]], opts)
	map(0, "t", "<leader>j", [[<C-\><C-n><C-W>j]], opts)
	map(0, "t", "<leader>k", [[<C-\><C-n><C-W>k]], opts)
	map(0, "t", "<leader>l", [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		pcall(set_terminal_keymaps)
	end,
})

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]])
