return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                integrations = {
                    treesitter = false,
                    lsp_trouble = false,
                    cmp = false,
                    gitsigns = false,
                    nvimtree = false,
                    notify = false,
                    mini = false,
                    bufferline = false,
                },
                vim.cmd.colorscheme("catppuccin"),
            })
        end,
    },
}
