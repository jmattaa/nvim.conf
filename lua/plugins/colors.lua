vim.pack.add {
    "https://github.com/loctvl842/monokai-pro.nvim"
}

require("monokai-pro").setup({
    override_palette = function(_)
        return {
            background = "#0e0e16",
        }
    end,
    override = function(scheme)
        return {
            Normal = { bg = "#0e0e16" },
            NormalFloat = { bg = "#0e0e16" },
            FloatBorder = { fg = scheme.base.dimmed4, bg = "#0e0e16" },
            Pmenu = {
                fg = scheme.base.white,
                bg = "#0e0e16",
            },
            PmenuSel = {
                fg = scheme.base.white,
                bg = "#252535",
                bold = true,
            },
            PmenuSbar = { bg = "#0e0e16" },
            PmenuThumb = { bg = scheme.base.dimmed4 },
            FloatTitle = {
                fg = scheme.base.white,
                bg = "#0e0e16",
                bold = true,
            },
        }
    end,
})

require "jmattaa.colorutils".setcolor "monokai-pro"
