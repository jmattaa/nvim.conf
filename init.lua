require "jmattaa.set"
require "jmattaa.keymaps"
require "jmattaa.lazy"
require "jmattaa.color".setColorscheme("modus")

local todo = require("jmattaa.todo")
vim.api.nvim_create_user_command("JTodo", todo.toggle, {})
