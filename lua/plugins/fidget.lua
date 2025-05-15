return {
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                normal_hl = "Normal",
            },
        },
        logger = {
             max_size = 512, -- max size of log file in kb
        }
    }
}
