vim.pack.add {
    "https://github.com/nvim-treesitter/nvim-treesitter"
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        if vim.bo.buftype ~= "" then return end
        local ft = args.match

        if not require("nvim-treesitter.parsers")[ft] then return end

        if not vim.treesitter.language.add(ft) then
            vim.notify("Installing TreeSitter language: " .. ft, vim.log.levels.INFO)
            require("nvim-treesitter.install").install(ft):await(function()
                vim.notify("Installed TreeSitter language: " .. ft, vim.log.levels.INFO)
                vim.treesitter.start()
            end)
        end

        vim.treesitter.start()
    end
})
