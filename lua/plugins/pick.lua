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

-- uncommited files
vim.keymap.set("n", "<leader>fu", function()
    local items = vim.fn.systemlist("git diff --name-only")

    if #items == 0 then
        vim.notify("No uncommitted files", vim.log.levels.INFO)
        return
    end

    -- filter out current file
    local current = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
    items = vim.tbl_filter(function(file)
        return file ~= current
    end, items)

    MiniPick.start({
        source = {
            items = items,
            name = "Uncommited files",
        }
    })
end)
