return {
    -- LspZero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',             -- Required
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim', -- Optional

            -- Autocompletion
            'hrsh7th/nvim-cmp',     -- Required
            'hrsh7th/cmp-nvim-lsp', -- Required
            'L3MON4D3/LuaSnip',     -- Required
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- colors
    'EdenEast/nightfox.nvim',
    'ellisonleao/gruvbox.nvim',
    'rose-pine/neovim',

    -- leap
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',

    'nvim-lualine/lualine.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'stevearc/oil.nvim',
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },
    'kblin/vim-fountain',

    -- DAP
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        }
    },
    'mfussenegger/nvim-dap',
    { 'rcarriga/nvim-dap-ui',            dependencies = { 'mfussenegger/nvim-dap' } },
    'theHamsta/nvim-dap-virtual-text',

    -- My plugins
    'jmattaa/quickmark.nvim',
    'jmattaa/regedit.vim',
    { dir = '/home/jonathan/Dev/VimPlugins/taskr.nvim' },
    'jmattaa/hsark',
}
