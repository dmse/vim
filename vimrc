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

let mapleader = " "

" buffer navigation
set hidden
nnoremap <leader>h :bp<CR>
nnoremap <leader>j :bn<CR>
nnoremap <leader>bl :ls<CR>

" tab navigation
nnoremap <C-h> :tabprev<CR>
nnoremap <C-j> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

" see: :help 'statusline
" statusline mod
set statusline=         "reset
set statusline+=%#todo# "set color
set statusline+=[       "open bracket char
set statusline+=%n      "buffer number
set statusline+=%M      "modifiable/modified flag
set statusline+=%R      "Readonly flag
set statusline+=%W      "Preview window flag
set statusline+=]%*     "close bracket & reset color
set statusline+=%<      "cut from here if line is too long
set statusline+=./%f    "relative path of the filename
set statusline+=\ [
set statusline+=%{&ff}\| "file format
set statusline+=%{strlen(&ft)?&ft:'NA'} "file type
set statusline+=]
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ (%P)  "escaped space, percent through file
