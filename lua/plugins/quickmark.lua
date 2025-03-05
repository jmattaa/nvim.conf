return {
    {
        "jmattaa/quickmark.nvim",
        config = function()
            require "quickmark".setup({
                messages = false,
                autosave = true,
            })
        end
    }
}
