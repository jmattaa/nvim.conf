-- for the quickbuildls and the syntax highlighting for quickbuild

local client = vim.lsp.start_client({
    name = "quickbuildls",
    cmd = {
        "sh", "-c",
        -- be sure to create a quickbuildls symlink
        "$HOME/quickbuildls 2>> /tmp/quickbuildls.log"
    },
})

if not client then
    vim.notify("Failed to start quickbuildls", vim.log.levels.ERROR)
    return
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "quickbuild" },
    callback = function(args)
        local bufnr = args.buf

        -- hilighting
        vim.bo.filetype = "quickbuild"

        -- lsp
        local ok = vim.lsp.buf_attach_client(bufnr, client)
        if ok then
            vim.notify("Attached quickbuildls", vim.log.levels.INFO)
        else
            vim.notify("Failed to attach quickbuildls", vim.log.levels.WARN)
        end
    end
})
