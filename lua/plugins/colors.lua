return {
    {
        "miikanissi/modus-themes.nvim",
        config = function()
            require('modus-themes').setup({
                style = "auto",
                transparent = false,
                dim_inactive = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },

            })
        end
    },
    {
        "morhetz/gruvbox",
        config = function ()
            vim.g.gruvbox_contrast_dark = "medium"
            vim.g.gruvbox_sign_column = "bg0"
        end
    }
}
