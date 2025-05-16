require "jmattaa.set"
require "jmattaa.keymaps"
require "jmattaa.lazy"
require "jmattaa.color".setColorscheme("modus")

local todo = require("jmattaa.todo")
vim.api.nvim_create_user_command("JTodo", todo.toggle, {})

local wutils = require("utils.window")
vim.api.nvim_create_user_command("Jcmd", function(opts)
    local cmd = opts.args or nil
    if cmd == nil then
        return
    end

    wutils.open_floating()
    vim.fn.termopen(cmd)
end, { nargs = "?" })
