vim.pack.add {
    "https://github.com/loctvl842/monokai-pro.nvim"
}

require("monokai-pro").setup({
    override_palette = function(_)
        return {
            background = "#0e0e16"
        }
    end
})

require "jmattaa.colorutils".setcolor "monokai-pro"
