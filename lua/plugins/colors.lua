vim.pack.add {
    "https://github.com/rebelot/kanagawa.nvim"
}

---@diagnostic disable-next-line: missing-fields
require("kanagawa").setup {
    transparent = true,
    background = {
        dark = "dragon"
    }
}

vim.cmd [[colorscheme kanagawa]]
