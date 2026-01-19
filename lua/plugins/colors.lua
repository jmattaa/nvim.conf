vim.pack.add({
    "https://github.com/vague2k/vague.nvim",
    "https://github.com/ellisonleao/gruvbox.nvim"
})

require("vague").setup { transparent = true, }
require("gruvbox").setup { transparent_mode = true }

vim.cmd.colorscheme "gruvbox"
