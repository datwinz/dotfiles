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

" Dvorak keybindings
" Moving
no h j
no t k
no d h
no n l
" Delete
no j d
" Next/prev line
no l n
no L N

" Smart way to move between windows
map <C-h> <C-W>j
map <C-t> <C-W>k
map <C-d> <C-W>h
map <C-n> <C-W>l

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
