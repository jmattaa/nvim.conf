-- gruvbox config
require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

require('rose-pine').setup({
    disable_background = true,
    disable_float_background = false,
    highlight_groups = {
        ColorColumn = { bg = 'rose', blend = 10 },
        CursorLine = { bg = 'subtle', blend = 10 },

        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "none" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
    },
})

function SetColorScheme(color) -- Color is the selected colorscheme
    color = color or 'rose-pine'
    vim.o.background = 'dark'
    vim.cmd.colorscheme(color)

    -- Transparent bg
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- Transparent statusline
    -- vim.api.nvim_set_hl(0, 'StatusLine', {bg = 'none'})
end

SetColorScheme()
