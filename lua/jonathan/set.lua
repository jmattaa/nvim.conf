-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

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

vim.opt.cursorline = false

vim.opt.cursorline = true

vim.g.mapleader = " "

-- Remove netrw banner info cuz it be anoying sometimes
vim.g.netrw_banner = 0

-- only show statusline when multiple windows (like vim cuz it's good)
vim.o.laststatus=1

