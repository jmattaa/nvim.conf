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
    use('bluz71/vim-moonfly-colors')

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
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
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

    -- Headlines
    use {
        'lukas-reineke/headlines.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('headlines').setup {
                markdown = {
                    query = vim.treesitter.query.parse(
                        "markdown",
                        [[
                        (atx_heading [
                            (atx_h1_marker)
                            (atx_h2_marker)
                            (atx_h3_marker)
                            (atx_h4_marker)
                            (atx_h5_marker)
                            (atx_h6_marker)
                        ] @headline)

                        (thematic_break) @dash

                        (fenced_code_block) @codeblock

                        (block_quote_marker) @quote
                        (block_quote (paragraph (inline (block_continuation) @quote)))
                    ]]
                    ),
                    headline_highlights = { "Headline" },
                    codeblock_highlight = "CodeBlock",
                    dash_highlight = "Dash",
                    dash_string = "-",
                    quote_highlight = "Quote",
                    quote_string = "┃",
                    fat_headlines = false,
                },
            }
        end,
    }

    -- !This is very important
    use('WhoIsSethDaniel/toggle-lsp-diagnostics.nvim')

    -- limelight
    use('junegunn/limelight.vim')

    -- some snippets
    use('SirVer/ultisnips')
    use('honza/vim-snippets')

    -- My plugins
    use('jmattaa/quickmark.nvim')
    use('jmattaa/regedit.vim')
    use('jmattaa/hsark')
end)
