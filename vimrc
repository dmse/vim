set nocompatible

filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo, author/plugin
" colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
" plugins
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'ap/vim-buftabline'
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

set background=dark
let g:solarized_termcolors=256
colorscheme PaperColor

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
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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
set statusline+=\ [     "open bracket char
set statusline+=%{&ff}\| "file format
set statusline+=%{strlen(&ft)?&ft:'NA'} "file type
set statusline+=]       "close bracket
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ (%P)  "escaped space, percent through file

" CtrlP, set config when using CtrlP
" default ignores
if exists('g:ctrlp_cmd')
    let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/](\.(git))$',
                \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|mp4|mp3)$',
                \ }
    nnoremap <leader>p :CtrlP<CR>
    nnoremap <leader>bb :CtrlPBuffer<CR>
endif

" syntastic< set config when using syntastic
if exists(':SyntasticInfo')
    set statusline+=%* " reset colour
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endif
