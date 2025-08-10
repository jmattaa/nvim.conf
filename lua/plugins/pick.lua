vim.pack.add({
    "https://github.com/echasnovski/mini.pick"
})

require("mini.pick").setup {}
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>fG", ":Pick files tool='git'<CR>")
