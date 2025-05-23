let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Using https://github.com/junegunn/vim-plug
Plug 'tpope/vim-sensible'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Enable syntax highlighting
syntax enable
colorscheme onehalflight

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
" Map space as leader
let mapleader=" "

"Netrw options
let g:netrw_banner = 0
map <Leader>gf :Explore<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fat finger avoidance
cmap Q q
cmap W w

" Windows
map <leader>c :close<CR>

" Lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Whitespace
set listchars=eol:^,tab:>-,space:·,trail:_
map <leader>w :set list<CR>
map <leader>q :set nolist<CR>

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
