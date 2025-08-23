return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- load before all other plugins
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = true, -- if you want transparency
                integrations = {
                    treesitter = true,
                    lsp_trouble = true,
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    nvimtree = true,
                    notify = true,
                    mini = true,
                    bufferline = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
