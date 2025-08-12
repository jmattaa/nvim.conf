vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",

    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",

    "https://github.com/folke/lazydev.nvim",

    "https://github.com/nvim-treesitter/nvim-treesitter",
}

require("lazydev").setup {
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

require("mason").setup()
require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd("InsertCharPre", {
    callback = function()
        vim.lsp.completion.get()
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        vim.o.completeopt = "menu,menuone,popup,fuzzy,noinsert"
        vim.lsp.completion.enable(
            true,
            client.id,
            args.buf,
            { autotrigger = true }
        )

        -- map <CR> to not accept the completion and instead be NORMAL!!!!
        -- <C-e> stops the completion and <CR> inserts a newline as it should
        vim.cmd [[inoremap <expr> <CR> pumvisible() ? "<C-e><CR>" : "<CR>"]]

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
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = {
        enable = true,
    },
}
