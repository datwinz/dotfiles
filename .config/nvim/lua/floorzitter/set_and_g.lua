--- Scrolling
vim.opt.so = 1
vim.opt.mousescroll = 'ver:1,hor:1'
-- Cursor look
vim.opt.guicursor = 'i:block'
-- Standard is mouse = nvi, do mouse = vi for scroll the cursor instead of the page
vim.opt.mouse = ''

-- Enable syntax highlighting
vim.opt.number = true
vim.opt.relativenumber = true
-- Ignore case when searching
vim.opt.ignorecase = true
-- Incremental search, makes search act like search in modern browsers
vim.opt.incsearch = true
-- Highlight search results
vim.opt.hlsearch = true

-- Tab options
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Tab to spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Colorscheme
vim.cmd.colorscheme('customonehalflight')

-- Netrw
vim.g.netrw_banner = 0
