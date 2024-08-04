local function setTransparentBg()
    vim.cmd([[highlight Normal ctermbg=none guibg=none]])
    vim.cmd([[highlight NonText ctermbg=none guibg=none]])
end

return {
    setTransparentBg = setTransparentBg
}
