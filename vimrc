set nocompatible

filetype off " required for vundle
" Vundle
" https://github.com/gmarik/Vundle.vim
"   To intall on a new machine:
"   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   Launch vim and run :PluginInstall
"   To install from command line: vim +PluginInstall +qall
"   To update plugins, run :BundleInstall!
"   If you remove a plugin from your vimrc, run :BundleClean to remove the old plugin.
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" Run :BundleInstall after changing this list
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo, author/plugin
" colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
" plugins
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-vinegar'
" Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'ap/vim-buftabline'
Plugin 'elixir-lang/vim-elixir'
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" windows/linux difference
let s:running_windows = has('win16') || has('win32') || has('win64')

syntax on

au FileType html setl sw=2 sts=2 ts=2 et
au FileType ruby setl sw=2 sts=2 ts=2 et
au FileType eruby setl sw=2 sts=2 ts=2 et

nnoremap ' `
nnoremap ` '

" 256 colours
set t_Co=256
set background=dark
let g:solarized_termcolors=256
" load prefered colour, skip error
silent! colorscheme PaperColor

if has("gui_running") && s:running_windows
    " remove extra gui elements
    set guioptions=
    " T:toolbar, m: menu, r: righthand scroll bar
    " set guioptions-=T
    " set guioptions-=m
    set guifont=Bitstream\ Vera\ Sans\ Mono:h10,Consolas:h9
    set lines=50 columns=150
endif

" highlight search & dynmically as the as typed
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
" allow buffers to be hidden if you've modified it.
set hidden
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" vim-buftabline
let g:buftabline_numbers = 1
let g:buftabline_separators = 1

" switch javascript on
let g:my_file_type = 0
function! ToggleFileType()
    if g:my_file_type == 0
        setlocal ft=javascript
        let g:my_file_type = 1
    else
        filetype detect
        let g:my_file_type = 0
    endif
endfunction
nmap <silent> ;s :call ToggleFileType()<CR>
