return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    priority = 900,               -- Load before snacks
    config = function()
        require("bufferline").setup({}) -- uses all defaults

        local opts = { noremap = true, silent = true }

        -- Optional keymaps if you still want basic navigation
        vim.keymap.set("n", "<S-k>", ":BufferLineCycleNext<CR>", opts)
        vim.keymap.set("n", "<S-j>", ":BufferLineCyclePrev<CR>", opts)
        vim.keymap.set("n", "<leader>w", ":bdelete<CR>", opts)
        vim.keymap.set("n", "<leader>W", ":bdelete<CR>", opts)
    end,
}
