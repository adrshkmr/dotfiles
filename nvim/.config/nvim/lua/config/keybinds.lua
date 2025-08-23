vim.g.mapleader = " "

vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 50

-- Quick actions
-- vim.keymap.set("n", "<C-s>", ":w<CR>", {})     -- Save
-- vim.keymap.set({ "n" }, "<C-x>", ":x<CR>", {}) -- Save and quit

-- All mode jk escape
vim.keymap.set({ "i", "v", "c" }, "jk", "<Esc>", { desc = "Exit to normal mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Netrw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

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

-- Nevigate better in terminal mode
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
    pattern = "*",
    callback = function()
        pcall(set_terminal_keymaps)
    end,
})

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Flash ke default keys ko disable
vim.keymap.set({ "n", "x", "o" }, "s", "<Nop>", { silent = true })
vim.keymap.set({ "n", "x", "o" }, "S", "<Nop>", { silent = true })
vim.keymap.set("o", "r", "<Nop>", { silent = true })
vim.keymap.set({ "o", "x" }, "R", "<Nop>", { silent = true })
