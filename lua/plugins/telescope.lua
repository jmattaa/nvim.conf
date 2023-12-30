return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local telescope = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
            vim.keymap.set("n", "<leader>fg", telescope.git_files, {})
            vim.keymap.set("n", "<leader>fl", telescope.live_grep, {})
            vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
            vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
            vim.keymap.set("n", "<leader>fc", telescope.colorscheme, {})
            vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
