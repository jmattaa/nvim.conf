vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- colors
    use { 'rose-pine/nvim', as = 'rose-pine' }
    use('kdheepak/monochrome.nvim')
    use('ellisonleao/gruvbox.nvim')

    use('norcalli/nvim-colorizer.lua')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- zen mode
    use('folke/zen-mode.nvim', function()
        require('zen-mode').setup {}
    end)

    -- Undotree
    use('mbbill/undotree')

    -- Vim fudgitive
    use('tpope/vim-fugitive')

    -- LspZero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                opts = {
                    ensure_installed = {
                        'clangd',
                        'clang-format',
                        'codelldb'
                    }
                }
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    -- Autopairs I need this
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- Markdown preview
    use('davidgranstrom/nvim-markdown-preview')
    -- markdown
    use('preservim/vim-markdown')

    -- latex
    use('lervag/vimtex')

    -- !This is very important
    use('WhoIsSethDaniel/toggle-lsp-diagnostics.nvim')

    -- limelight
    use('junegunn/limelight.vim')

    -- some snippets
    use('SirVer/ultisnips')
    use('honza/vim-snippets')

    -- fountain for screenwriting
    use('kblin/vim-fountain')

    -- DAP
    use {
        'jay-babu/mason-nvim-dap.nvim',
        requires = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        }
    }
    use('mfussenegger/nvim-dap')
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use('theHamsta/nvim-dap-virtual-text')

    -- My plugins
    use('jmattaa/quickmark.nvim')
    use('jmattaa/regedit.vim')
    use('jmattaa/hsark')
end)
