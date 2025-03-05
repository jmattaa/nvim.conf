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
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                transparent_mode = true
            })
        end
    }
}
