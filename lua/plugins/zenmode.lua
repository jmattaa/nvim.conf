return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            backdrop = 0,
            options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = "0",
                list = false,
            },
        },
        on_open = function(win)
            vim.wo[win].colorcolumn = ""
        end,
    }
}
