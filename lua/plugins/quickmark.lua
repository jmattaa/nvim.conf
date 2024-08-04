return {
    {
        "jmattaa/quickmark.nvim",
        config = function()
            require("quickmark").setup({
                key_mappings = {
                    list = '<leader>qq',
                    add = '<leader>qa',
                    remove = '<leader>qr',
                    remove_all = '<leader>qR',
                    save = '<leader>qs',
                    shortcut = '<leader>qn',
                    open_shortcut = '<leader>qo',
                },
            })
        end
    }
}
