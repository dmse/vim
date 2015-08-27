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

" 256 colours
set t_Co=256
set background=dark
let g:solarized_termcolors=256
" load prefered colour, skip error
silent! colorscheme PaperColor

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
set history=100
set title
set scrolloff=9
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

" quick esc in insert mode
inoremap jk <ESC>

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

let mapleader = "\<space>"
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" buffer navigation
set hidden
nnoremap <leader>h :bp<CR>
nnoremap <leader>j :bn<CR>
" list buffer and goto#/delete#
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bd :ls<CR>:bd<space>

" window/split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab navigation
" nnoremap <C-h> :tabprev<CR>
" nnoremap <C-j> :tabnext<CR>
" nnoremap <C-n> :tabnew<CR>

" see: :help 'statusline
" statusline mod
set statusline=         " reset
set statusline+=%#todo# " set colour
set statusline+=[       " open bracket
set statusline+=%n      " buffer number
set statusline+=%M      " modifiable/modified flag
set statusline+=%R      " Readonly flag
set statusline+=%W      " Preview window flag
set statusline+=]%*     " close bracket, reset colour
set statusline+=\ %<%.99F\  " space, truncate, min width, full path of the filename, space
set statusline+=[       " open bracket
set statusline+=%{&ff}\| " file format, pipe
set statusline+=%{strlen(&ft)?&ft:'NA'} " file type
set statusline+=]       " close bracket
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ (%P)  " space, percent through file

" CtrlP
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.(git))$',
            \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|mp4|mp3)$',
            \ }
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
