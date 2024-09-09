return {
    {
        dir = "~/dev/VimPlugins/quickmark.nvim",
        config = function ()
            require"quickmark".setup({
                messages = false,
                autosave = true,
            })
        end
    }
}
