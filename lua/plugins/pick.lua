vim.pack.add {
    "https://github.com/echasnovski/mini.pick",
}


local MiniPick = require "mini.pick"
MiniPick.setup {
    mappings = {
        mark_all = "<C-a>",       -- default
        choose_marked = "<M-CR>", -- default
        open_quickfix_list = {
            char = "<C-q>",
            func = function()
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<C-a>", true, false, true),
                    'n',
                    true
                )
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<M-CR>", true, false, true),
                    'n',
                    true
                )
            end
        }
    },
}

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>fG", ":Pick files tool='git'<CR>")
