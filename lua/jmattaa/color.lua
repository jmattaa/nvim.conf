local function setColorscheme(color)
    color = color or 'default'
    vim.o.background = 'dark'
    vim.cmd.colorscheme(color)

    -- Transparent bg
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- Transparent statusline
    -- vim.api.nvim_set_hl(0, 'StatusLine', {bg = 'none'})
end

return {
    setColorscheme = setColorscheme
}
