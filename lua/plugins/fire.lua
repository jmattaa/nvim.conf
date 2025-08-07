return {
    "jmattaa/fire.nvim",
    config = function()
        require("fire").setup {
            win = {
                size = 20,
            },
        }
    end
}
