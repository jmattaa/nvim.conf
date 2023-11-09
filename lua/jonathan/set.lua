-- Numbers
vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"

vim.opt.cursorline = true
vim.opt.guicursor = "" -- keep insert mode with block cursor

vim.g.mapleader = " "

-- Remove netrw banner info cuz it be anoying sometimes
vim.g.netrw_banner = 0

-- global statusline
vim.o.laststatus=3

