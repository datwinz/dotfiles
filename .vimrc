" Enable syntax highlighting
syntax enable

" Enable line numbers
set number relativenumber

" Ignore case when searching
set ignorecase

" Search options
" Incremental search, makes search act like search in modern browsers
set incsearch
" Highlight search results
set hlsearch

" Vim keymaps
" Map <Space> to / (search)
map <space> /

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab options
" Auto tab smartst, smarter, smart
filetype on
filetype plugin on
filetype indent on
set smartindent
set autoindent
" Tab to spaces
set expandtab
set tabstop=4
set shiftwidth=4

call plug#begin()
" Using https://github.com/junegunn/vim-plug
Plug 'tpope/vim-sensible'
call plug#end()
