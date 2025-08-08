require "jmattaa.set"
require "jmattaa.keymaps"
require "jmattaa.lazy"
require "jmattaa.quickbuild"
require "jmattaa.color".setColorscheme("sunbather")

local todo = require("jmattaa.todo")
vim.api.nvim_create_user_command("JTodo", todo.toggle, {})
