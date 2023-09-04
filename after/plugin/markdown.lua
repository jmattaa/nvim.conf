-- Enable syntax highlighting for Markdown files
vim.cmd([[
  autocmd BufRead,BufNewFile *.md set syntax=markdown conceallevel=2 concealcursor-=n
]])

-- Configure vim-markdown
vim.g.vim_markdown_folding_disabled = 0
vim.g.vim_markdown_frontmatter = 1
