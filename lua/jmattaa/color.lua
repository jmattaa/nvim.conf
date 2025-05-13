local function setColorscheme(color)
    color = color or "default"
    vim.o.background = "dark"
    vim.cmd.colorscheme(color)

    -- make the float bg blend a bit more with the rest of the editor
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg })

    -- Transparent bg
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- Transparent statusline
    -- vim.api.nvim_set_hl(0, "StatusLine", {bg = "none"})
end

return {
    setColorscheme = setColorscheme
}
