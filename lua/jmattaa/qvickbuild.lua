-- for the qvickbuildls and the syntax highlighting for qvickbuild
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "qvickbuild", "qvickbuild" },
    callback = function(args)
        local clients = vim.lsp.get_clients({ name = "qvickbuildls" })

        ---@type integer?
        local client_id = clients[1] and clients[1].id or nil
        if not client_id then
            client_id = vim.lsp.start({
                name = "qvickbuildls",
                cmd = {
                    "sh", "-c",
                    -- be sure to create a qvickbuildls symlink
                    "$HOME/qvickbuildls 2>> /tmp/qvickbuildls.log"
                },
            })
        end

        if not client_id then
            vim.notify("Failed to start qvickbuildls", vim.log.levels.ERROR)
            return
        end

        local bufnr = args.buf

        -- hilighting
        vim.bo.filetype = "qvickbuild"

        -- lsp
        local ok = vim.lsp.buf_attach_client(bufnr, client_id)
        if ok then
            vim.notify("Attached qvickbuildls", vim.log.levels.INFO)
        else
            vim.notify("Failed to attach qvickbuildls", vim.log.levels.WARN)
        end
    end
})
