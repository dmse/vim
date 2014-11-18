execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

autocmd FileType html setl sw=2 sts=2 et
autocmd FileType ruby setl sw=2 sts=2 et

" dynmically as the as typed
set hlsearch
set incsearch
" ignore case when searching, except when using capital letters
set ignorecase 
set smartcase
" Intuitive backspacing in insert mode
set backspace=indent,eol,start
set autoindent
set smartindent
" cursor shows matching ")" and "}"
set showmatch
set wildmenu
set wildmode=list:longest
set history=1000
set title
set scrolloff=3
" always shows the status line
set ls=2

" all tab characters entered will turn to spaces
set expandtab
" numbers of spaces to (auto)indent
set shiftwidth=4
" numbers of spaces of tab character
set tabstop=4

set nobackup
set nowritebackup
set noswapfile
set number
set ruler

nnoremap <C-h> :tabprev<CR>
nnoremap <C-j> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
