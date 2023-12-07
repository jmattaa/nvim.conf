-- jk to normalmode
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>nt", ":Ex<CR>")

vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>cf", "<C-^>")
vim.keymap.set("n", "gf", ":e <cfile><CR>", { silent = true })
