set nocompatible

" windows/linux difference
let s:running_windows = has('win32') || has('win64')
let s:running_unix = has('unix')

" test for vim and neovim coexistence
if has('nvim') && s:running_windows
    " echom 'nvim/nvim-qt win'
    let s:editor_root=expand("~/AppData/Local/nvim")
elseif has('nvim') && !s:running_windows
    " echom 'nvim/nvim-qt non-win'
    " use below if its not win
    let s:editor_root=expand("~/.config/nvim")
else
    " echom 'vim'
    let s:editor_root=expand("~/.vim")
endif


" vim-plug
call plug#begin(s:editor_root . "/plugged")
" colours
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
" plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-buftabline'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
" lang
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
call plug#end()


filetype plugin indent on
syntax on

augroup FTOpts
    autocmd!
    au FileType vim         setl sw=4 sts=4 ts=4 et
    au FileType ruby,eruby  setl sw=2 sts=2 ts=2 et
    au FileType python      setl sw=4 sts=4 ts=8 et
    " au FileType html      setl sw=2 sts=2 ts=2 et
augroup END

nnoremap ' `
nnoremap ` '

" 256 colours
set t_Co=256
set background=dark
silent! colorscheme PaperColor  " load prefered colour, skip error

if has("gui_running") && s:running_windows
    " remove extra gui elements
    set guioptions=
    " T:toolbar, m: menu, r: righthand scroll bar
    " set guioptions-=T
    " set guioptions-=m
    set guifont=Bitstream\ Vera\ Sans\ Mono:h9,Consolas:h9
    " set guifont=Ubuntu\ Mono:h11,Consolas:h9
    set lines=50 columns=150
endif

if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j    " remove comment leader when joining comment lines
endif

set cul         " highlight the current line
set hlsearch    " highlight search
set incsearch   " move to search dynamically as typed
set ignorecase  " ignore case when searching, except when using capital letters
set smartcase
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set autoindent  " copy indent from current line when starting a new line
set smartindent " auto indent when starting a new line
set showmatch   " cursor shows matching ")" and "}"
set wildmenu
set wildmode=list:longest
set history=100
set title
set scrolloff=9 " always show 9 lines above or below cursor
set ls=2        " always shows the status line

set expandtab       " all tab characters entered will turn to spaces
set shiftwidth=2    " numbers of spaces to (auto)indent
set tabstop=2       " numbers of spaces of tab character

set nobackup
set nowritebackup
set noswapfile
set number          " show number
set relativenumber  " display relative numbers relative to the cursor line
set ruler

set linebreak           " wrap long lines at characters in 'breakat'
if has('linebreak')
    let &showbreak=' '  " display a leading space when line is wrapped
endif

" mouse setting
behave xterm
set mouse=a

" quick esc in insert mode
inoremap jk <ESC>

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

let mapleader = "\<space>"
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" buffer navigation
set hidden  " allows you to hide buffers with unsaved changes
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
" list buffer and goto#/delete#
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bd :ls<CR>:bd<space>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" loclist navigation
nnoremap <leader>lp :lprevious<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lr :lrewind<CR>

" tab navigation
" nnoremap <C-h> :tabprev<CR>
" nnoremap <C-j> :tabnext<CR>
" nnoremap <C-n> :tabnew<CR>

" statusline mod
" see :help 'statusline
set statusline=         " reset
set statusline+=%#todo# " set colour to #todo#
set statusline+=[       " open bracket
set statusline+=%n      " buffer number
set statusline+=%M      " modifiable/modified flag
set statusline+=%R      " Readonly flag
set statusline+=%W      " Preview window flag
set statusline+=]%*     " close bracket, reset colour
" Linter in statusline
set statusline+=%#warningmsg#
set statusline+=%{exists('g:loaded_ale')&&g:loaded_ale?'['.LinterStatus().']':''}
set statusline+=%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
set statusline+=%*
" Linter in statusline
set statusline+=\ %<%.99F\  " space, truncate, min width, full path of the filename, space
set statusline+=[           " open bracket
set statusline+=%{&ff}\|    " file format, pipe
set statusline+=%{strlen(&ft)?&ft:'NA'} " file type
set statusline+=%{&ft=='ruby'?'-'.g:ruby_version:''}    " ruby version
set statusline+=]       " close bracket
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ (%P)  " space, percent through file


" vim-buftabline
let g:buftabline_numbers = 1
let g:buftabline_separators = 1

" CtrlP
let g:ctrlp_working_path_mode = ''  " disble local working directory
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>

" ale (async linting)
" let g:ale_lint_on_enter = 0               " 1
" let g:ale_lint_on_save = 0                " 0, set 1 when lint_on_text_changed is normal|never(off)
" let g:ale_lint_on_text_changed = 'never'  " always, insert, normal|never(off)
" let g:ale_lint_delay = 200                " 200, enable to save CPU/Battery usage
" let g:ale_open_list = 1                   " 0|'on_save'
" let g:ale_set_loclist = 1                 " 1, use loclist instead of quickfix
" let g:ale_set_quickfix = 1                " 0, use quickfix instead of loclist
" let g:ale_list_window_size = 5            " 10, use with loclist|quickfix
let g:ale_sign_error = '>>'                 " >>
let g:ale_sign_warning = '--'               " --
let g:ale_echo_msg_error_str = g:ale_sign_error " use sign instead of str
let g:ale_echo_msg_warning_str = g:ale_sign_warning
let g:ale_echo_msg_format = '%linter%|%severity% %s'
function! LinterStatus() abort
    if exists('g:loaded_ale') && g:loaded_ale
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? 'OK' : printf(
                    \   '%dW %dE',
                    \   all_non_errors,
                    \   all_errors
                    \)
    endif
endfunction

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


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


" adopt ruby environment, windows
if s:running_windows
    " pik
    " let s:pik_ruby_info = system('pik info')
    " if len(s:pik_ruby_info) > 0
    "     let s:pik_ruby_version = matchlist(s:pik_ruby_info, 'version: *"\([^"]\+\)*"')[1]
    "     let s:pik_ruby_dir = matchlist(s:pik_ruby_info, 'binaries:\nruby: *"\([^"]\+\)*"')[1].'\'
    "     let g:ruby_default_path = [s:pik_ruby_dir]  " accepts a list!
    " endif

    " uru
    let s:uru_ruby_ls = system('uru ls --verbose')
    if len(s:uru_ruby_ls) > 0
        let s:uru_ruby_info = matchstr(s:uru_ruby_ls, '=>\(.\{-}\n\)\{3}')
        " begin match with =>
        " then group \( anything . as little as possible \{-} until newline \n \) 
        " stops at match count \{3}
        let s:uru_ruby = split(s:uru_ruby_info,'\n')
        let s:uru_ruby_dir = substitute(s:uru_ruby[2], ' *Home: ', '', 'g')
        let g:ruby_version = substitute(s:uru_ruby[1], ' *ID: ', '', 'g')
        let g:ruby_default_path = [s:uru_ruby_dir]  " accepts a list!
    endif
endif

if s:running_unix
    " uses rbenv
    if len(system('which rbenv')) > 0
        let s:this_ruby_info = system('rbenv version')
        if len(s:this_ruby_info) > 0
            " let g:ruby_version = matchstr(s:this_ruby_info, '\(.\{-}\s\)') " this includes the space character
            let g:ruby_version = matchstr(s:this_ruby_info, '\d*.\d*.\d*')
        endif
    else
        let g:ruby_version = 'NOTFOUND'
    endif
endif


" prettyprint JSON in buffer
function! Ppjson()
    %!python -m json.tool
endfunction


" netrw Explorer
let g:netrw_liststyle = 3 " Can cycle through `i`
" How files will be opened;
" 1: horizontal split
" 2: vertial split
" 3: new tab
" 4: previous window
let g:netrw_browse_split = 2
" Set width of the explorer
let g:netrw_winsize = 25
" Open explorer, focus on the right panel
augroup netrwExplorer
    autocmd!
    au VimEnter * :Vexplore
    au VimEnter * wincmd l
augroup END
