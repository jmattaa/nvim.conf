vim.g.mapleader = " "

-- Numbers
vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"
vim.opt.laststatus = 1

vim.opt.cursorline = true
vim.opt.guicursor = "" -- keep insert mode with block cursor

-- yeh cuz vim looks better
vim.opt.fillchars = "vert:|,horiz:━"

-- remove the netrw info stuff cuz it be anoying sometimes
vim.g.netrw_banner = 0
