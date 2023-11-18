require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
            {
                'filetype',
                colored = true,
                icon_only = false,
                icon = { align = 'right' },
            },
            '%=',
            {
                'filename',
                file_status = true,
                newfile_status = false,
                path = 1,

                symbols = {
                    modified = '',
                    readonly = '',
                    unnamed = '[No Name]',
                }
            },
        },
        lualine_x = {
            {
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' LSP:',
            }
        },
        lualine_y = { 'diagnostics', 'fileformat' },
        lualine_z = { { 'datetime', style = "%H:%M" }, 'location' }
    },
    tabline = {},
    winbar = {
    },
    inactive_winbar = {},
    extensions = {},
}

