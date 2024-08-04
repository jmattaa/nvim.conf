return {
    "junegunn/fzf", -- idk but you need both this and fzf.vim
    {
        "junegunn/fzf.vim",
        build = function() vim.fn["fzf#install"]() end,
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>ff", ":Files<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fb", ":Buffers<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fg", ":Rg<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fc", ":Colors<CR>",
                { noremap = true, silent = true })
        end
    },
}
