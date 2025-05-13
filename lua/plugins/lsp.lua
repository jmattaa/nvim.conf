return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    scrollbar = false,
                    border = "rounded",
                    winhighlight = "Normal:Normal",
                },
                documentation = {
                    scrollbar = false,
                    border = "rounded",
                    winhighlight = "Normal:Normal",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = vim.NIL,   -- idk but normal nil dosen't work here
                ["<S-Tab>"] = vim.NIL, -- so we gotta use vim.NIL
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            float = {
                scrollbar = false,
                border = "rounded",
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
                vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end
        })
    end
}
