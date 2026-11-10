vim.pack.add {
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim"
}

require "noice".setup {
    views = {
        cmdline_popup = {
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            position = {
                row = 5,
                col = "50%"
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
        popupmenu = {
            border = {
                style = "rounded",
                padding = { 0, 0 },
            },
        },
    },
    messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "notify",
    },
}
