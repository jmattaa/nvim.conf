vim.pack.add({
    "https://github.com/vague2k/vague.nvim",
    "https://github.com/miikanissi/modus-themes.nvim"
})

require("vague").setup { terminal_colors = true }

-- giving it a bit more contrast to work with ghostty
require("modus-themes.colors").modus_vivendi.bg_dim = "#676767"
require("modus-themes").setup { line_nr_column_background = false }

require "jmattaa.colorutils".setcolor "modus"
