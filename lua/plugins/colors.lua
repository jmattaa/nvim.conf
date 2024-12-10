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
}
