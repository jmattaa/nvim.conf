return {
    'epwalsh/obsidian.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "yeh",
                path = "/Users/jonathan/Documents/yeh"
            }
        },
        ui = {
            enable = false -- cuz we be using render-markdown.nvim
        }
    }
}
