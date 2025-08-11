function PackClean()
    local packages = vim.pack.get()
    for _, package in pairs(packages) do
        if not package.active then
            vim.pack.del { package.spec.name }
        end
    end
end

vim.keymap.set("n", "<leader>pc", ":lua PackClean()<CR>")
