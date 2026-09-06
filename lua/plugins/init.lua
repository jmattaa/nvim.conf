require "plugins.lsp"
require "plugins.colors"
require "plugins.pick"
require "plugins.fidget"
require "plugins.treesitter"
require "plugins.tinycmdline"

vim.pack.add {
    "https://github.com/Exafunction/windsurf.vim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/jmattaa/fire.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
}

require "fire".setup {}
require "nvim-autopairs".setup {}
