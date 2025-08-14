require "plugins.lsp"
require "plugins.colors"
require "plugins.oil"
require "plugins.pick"
require "plugins.fidget"

vim.pack.add {
    "https://github.com/Exafunction/codeium.vim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/jmattaa/fire.nvim",
}

require("fire").setup {
    size = 10,
}

require("nvim-autopairs").setup {}
