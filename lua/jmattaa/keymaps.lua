-- config reload!!
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>nt", ":Ex<CR>", { silent = true })

-- so we indent in visual mode and stay there
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- copying stuff 🔥
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- nice change file stuff
vim.keymap.set("n", "<leader>cf", "<C-^>")

-- todo shi
vim.keymap.set("n", "<leader>tt", ":JTodo<CR>")
