require "jmattaa.set"
require "jmattaa.keymaps"
require "jmattaa.lazy"
require "jmattaa.quickbuild"
require "jmattaa.color".setColorscheme("moonfly")

local todo = require("jmattaa.todo")
vim.api.nvim_create_user_command("JTodo", todo.toggle, {})

local wutils = require("utils.window")
vim.api.nvim_create_user_command("Jcmd", function(opts)
    local cmd = opts.args or nil
    if cmd == nil then
        return
    end


    local wininfo = wutils.open_floating()
    local bufnr = wininfo.buf
    local winnr = wininfo.win

    vim.cmd("terminal " .. cmd)
    vim.cmd("startinsert")

    -- automatically close the window when the command finishes
    vim.api.nvim_create_autocmd("TermClose", {
        buffer = bufnr,
        once = true,
        callback = function()
            vim.api.nvim_win_close(winnr, true)
        end
    })
end, { nargs = "?" })
