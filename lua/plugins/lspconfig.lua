return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local lsp = require("lsp-zero")

            lsp.preset("recommended")

            lsp.ensure_installed({
                "lua_ls",
                "tsserver",
                "eslint",
                "clangd",
            })

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })
            cmp_mappings["<S-Tab>"] = nil

            lsp.setup_nvim_cmp({
                mapping = cmp_mappings,
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end)

            lsp.setup()
        end,
    },
}
