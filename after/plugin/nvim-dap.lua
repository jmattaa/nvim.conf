require("mason").setup()
require("mason-nvim-dap").setup({
    handlers = {
        function(config)
            -- all sources with no handler get passed here
            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
        end,
        codelldb = function(config)
            config.configurations = {
                {
                    name = 'LLDB: Launch',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = function()
                        local args_string = vim.fn.input("Input arguments: ")
                        return vim.split(args_string, " ")
                    end,
                },
            }
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<leader>dr', ':DapContinue<CR>')
