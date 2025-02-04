return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    config = function()
        vim.api.nvim_set_hl(0, 'RenderMarkdownDash', { fg = '#342434' })

        require('render-markdown').setup({
            heading = {
                sign = false,
                width = 'block',

                backgrounds = {},
            },
            dash = {
                enabled = true,
                icon = '─',
                width = 'full',
                highlight = 'RenderMarkdownDash',
            },
        })
    end,
}
