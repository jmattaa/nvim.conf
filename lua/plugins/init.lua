return {
    {
        'windwp/nvim-autopairs',
        config = true
    },
    {
        'mvllow/modes.nvim',
        config = function()
            require('modes').setup({
                line_opacity = 0.30,
            })
        end
    }
}
