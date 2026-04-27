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

-- stuff to open man page for word under cursor pretty nice shi
vim.keymap.set("n", "<leader>k", ":Man<CR>")

-- shi that you need https://github.com/jmattaa/scripts for
vim.keymap.set("n", "<leader>if", ":.!ifndef %:t<CR>")
