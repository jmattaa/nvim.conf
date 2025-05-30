return {
    {
        "windwp/nvim-autopairs",
        config = true
    },
    "Exafunction/codeium.vim",
    "preservim/vim-pencil",
    {
        "mvllow/modes.nvim",
        config = function()
            require("modes").setup({
                line_opacity = 0.30,
            })
        end
    },
    "tpope/vim-fugitive",
    {
        "3rd/image.nvim",
        opts = {
            processor = "magick_cli" -- TODO: FIX THIS find a way to use magick_rock instead
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                highlight = {
                    enable = true,
                }
            }
        end
    },
}
