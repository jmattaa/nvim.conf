return {
    "tpope/vim-fugitive",
    config = function()
        local opts = { silent = true }

        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts)
        vim.keymap.set("n", "<leader>gg", ":G add .<CR>", opts)
        vim.keymap.set("n", "<leader>gc", ":G commit -s<CR>", opts)
        vim.keymap.set("n", "<leader>gp", ":G push<CR>", opts)
    end,
}
