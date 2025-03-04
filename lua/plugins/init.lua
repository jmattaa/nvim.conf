return {
    'folke/zen-mode.nvim',
    {
        'windwp/nvim-autopairs',
        config = true
    },
    'Exafunction/codeium.vim',
    {
        'mvllow/modes.nvim',
        config = function()
            require('modes').setup({
                line_opacity = 0.30,
            })
        end
    },
    'tpope/vim-fugitive',
}
