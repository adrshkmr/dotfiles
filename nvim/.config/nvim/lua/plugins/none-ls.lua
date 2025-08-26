return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local null_ls = require("null-ls")
        local b = null_ls.builtins

        null_ls.setup({
            sources = {
                -- Lua
                b.formatting.stylua,
                --	b.diagnostics.luacheck,

                -- Python
                b.formatting.black,
                b.formatting.isort,
                --				b.diagnostics.flake8,

                -- C / C++
                b.formatting.clang_format,
                b.diagnostics.cppcheck, -- optional
                -- Rust
                --                b.formatting.rustfmt,
                --		b.diagnostics.clippy,

                -- Java
                b.formatting.google_java_format,

                -- JS / TS / React / CSS / Tailwind
                b.formatting.prettierd.with({
                    extra_args = { "--trailing-comma", "none" },
                }),
                --               b.diagnostics.eslint_d,
                --              b.code_actions.eslint_d,

                -- HTML / CSS / JSON / YAML / Markdown
                b.diagnostics.stylelint,
            },
        })

        vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
        -- format on save
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     callback = function()
        --         vim.lsp.buf.format({ async = false })
        --     end,
        -- })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })
    end,
}
