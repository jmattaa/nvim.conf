-- for the quickbuildls and the syntax highlighting for quickbuild
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "quickbuild" },
    callback = function(args)
        local clients = vim.lsp.get_clients({ name = "quickbuildls" })

        ---@type integer?
        local client_id = clients[1] and clients[1].id or nil
        if not client_id then
            client_id = vim.lsp.start({
                name = "quickbuildls",
                cmd = {
                    "sh", "-c",
                    -- be sure to create a quickbuildls symlink
                    "$HOME/quickbuildls 2>> /tmp/quickbuildls.log"
                },
            })
        end

        if not client_id then
            vim.notify("Failed to start quickbuildls", vim.log.levels.ERROR)
            return
        end

        local bufnr = args.buf

        -- hilighting
        vim.bo.filetype = "quickbuild"

        -- lsp
        local ok = vim.lsp.buf_attach_client(bufnr, client_id)
        if ok then
            vim.notify("Attached quickbuildls", vim.log.levels.INFO)
        else
            vim.notify("Failed to attach quickbuildls", vim.log.levels.WARN)
        end
    end
})
