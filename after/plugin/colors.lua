require('rose-pine').setup({
    disable_background = true
})

function SetColorScheme(color) -- Color is the selected colorscheme
	color = color or 'moonfly'
	vim.cmd.colorscheme(color)

    -- Transparent bg
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- Transparent statusline
    -- vim.api.nvim_set_hl(0, 'StatusLine', {bg = 'none'})
end

SetColorScheme()
