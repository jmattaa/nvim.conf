-- RELOAD CONFIG
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>nt", ":Explore<CR>", { silent = true })

-- so we stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- nice jump files
vim.keymap.set("n", "<leader>cf", "<C-^>")
