vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",

    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/nvim-cmp",

    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",

    -- treesitter should it be here?
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

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

-- treesitter
require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = {
        enable = true,
    }
}
