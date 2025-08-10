vim.pack.add({    
    "https://github.com/stevearc/oil.nvim"
})

require("oil").setup({
    view_options = {
        show_hidden = true,
    }
})

-- override `:Explore` with `:Oil`
vim.api.nvim_create_user_command("Explore", function()
    vim.cmd("Oil")
end, {})
