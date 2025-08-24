vim.g.mapleader = " "

vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 50

-- Quick actions
-- vim.keymap.set("n", "<C-s>", ":w<CR>", {})     -- Save
-- vim.keymap.set({ "n" }, "<C-x>", ":x<CR>", {}) -- Save and quit

-- All mode jk escape
-- vim.keymap.set({ "i", "v", "c" }, "jk", "<Esc>", { desc = "Exit to normal mode" })
-- vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Navigate vim panels better
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", {})

-- Nevigate better in terminal mode
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	local map = vim.api.nvim_buf_set_keymap
	map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	map(0, "t", "jk", [[<C-\><C-n>]], opts)
	map(0, "t", "<C-[", [[<C-\><C-n>]], opts)
	map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
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

-- visual mode j&k moves
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")
