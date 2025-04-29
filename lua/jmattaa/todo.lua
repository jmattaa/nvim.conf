-- a simple script utilizing my todo script from
-- https://github.com/jmattaa/scripts
-- this opens the todo file in a floating window

local wutils = require("utils.window")

local M = {}

M.state = {
    win = -1,
    buf = -1
}

function M.open()
    local filename = vim.fn.system("todo getfile"):gsub("%s+$", "")
    if vim.fn.filereadable(filename) ~= 1 then
        vim.notify("Invalid file: " .. filename, vim.log.levels.ERROR)
    end

    local wininfo = wutils.open_floating()
    vim.cmd.edit(filename)

    M.state.win = wininfo.win
    if not M.state.win then
        M.state.buf = wininfo.buf
    end
end

function M.closewin()
    vim.api.nvim_win_close(M.state.win, true)
    M.state.win = -1
end

function M.toggle()
    if not vim.api.nvim_win_is_valid(M.state.win) then
        M.open()
    else
        M.closewin()
    end
end

return M
