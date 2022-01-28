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
    let s:editor_root=expand("~/.config/nvim")
else
    " echom 'vim'
    let s:editor_root=expand("~/.vim")
endif


" vim-plug
call plug#begin(s:editor_root . "/plugged")
" colours
" Plug 'altercation/vim-colors-solarized'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
" lang
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-python/python-syntax'
Plug 'rhysd/vim-crystal'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
" plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript','css','less','scss','json','vue','yaml','html','xml'] }
" "bprev doesnt work with vinegar! maybe netrw too?
" Plug 'tpope/vim-vinegar'
" Plug 'jiangmiao/auto-pairs'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
" Plug 'justinmk/vim-sneak'
call plug#end()


filetype plugin indent on
syntax on

augroup FTOpts
    autocmd!
    au FileType ruby,eruby,html                 setl sw=2 sts=2 ts=2 et
    au FileType vim,sql,python,java,erlang	setl sw=4 sts=4 ts=8 et
    au FileType c,cpp                           setl sw=8 sts=8 ts=8 noet
    au BufNewFile,BufRead *.term                set ft=erlang
augroup END

nnoremap ' `
nnoremap ` '

" 256 colours
set t_Co=256
" set background=light
" silent! colorscheme PaperColor  " load prefered colour, skip error
set background=dark
silent! colorscheme nord  " load prefered colour, skip error

" detect current resolution in linux, set vim resolution
function! SetLC()
    if has("gui_macvim")
        let cmd = "system_profiler SPDisplaysDataType | awk '/Resolution/{print $2}'"
    elseif has("gui_running") && has("unix")
        let cmd = "xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1"
    endif
    let rst = trim(system(cmd))
    " echom rst
    if rst == '3840'
        set lines=61 columns=210    " resolution for 4k screen
    elseif rst == '2560'
        set lines=50 columns=150    " resolution for 2k screen
    elseif rst == '1920'
        set lines=30 columns=140    " resolution for 1080 screen
    else
        set lines=24 columns=80     " resolution for anything lower screen
    end
endfunction

if has("gui_running") && s:running_windows
    " remove extra gui elements
    set guioptions=
    " T:toolbar, m: menu, r: righthand scroll bar
    " set guioptions-=T
    " set guioptions-=m
    set guifont=JetBrains\ Mono\ NL:h9,Ubuntu\ Mono:h11,Menlo:h9,Consolas:h9
elseif has("gui_macvim")
    set guifont=JetBrains\ Mono:h12,Menlo:h11
    call SetLC()
elseif has("gui_running") && has("unix")
    set guioptions=Tm
    set guifont=JetBrains\ Mono\ 9
    call SetLC()
endif

if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j    " remove comment leader when joining comment lines
endif

set cul         " highlight the current line
set hlsearch    " highlight search
" set incsearch   " move to search dynamically as typed
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
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" buffer navigation
set hidden  " allows you to hide buffers with unsaved changes
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
" list buffer and goto#/delete#
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bd :ls<CR>:bd<space>

" tab navigation
" nnoremap <C-h> :tabprev<CR>
" nnoremap <C-j> :tabnext<CR>
" nnoremap <C-n> :tabnew<CR>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" loclist navigation
nnoremap <leader>lp :lprevious<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lr :lrewind<CR>

" Esc to exit :term
tnoremap <Esc> <C-\><C-n>

" GitGutter Navigation
nnoremap <leader>gp :GitGutterPrevHunk<CR>
nnoremap <leader>gn :GitGutterNextHunk<CR>

inoremap () ()<Left>
inoremap {} {}<Left>
inoremap <> <><Left>
inoremap <<>> <<>><Left><Left>
inoremap [] []<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap \|\| \|\|<Left>
inoremap // //<Left>


" statusline mod
" see :help 'statusline

" :h mode() to see all modes
" global variable mapping for mode()
let g:currentmode={
      \ "n"      : "Normal",
      \ "no"     : "Operator Pending",
      \ "v"      : "Visual",
      \ "V"      : "Visual Line",
      \ "\<c-v>" : "Visual Block",
      \ "s"      : "Select",
      \ "S"      : "Select Line",
      \ "\<c-s>" : "Select Block",
      \ "i"      : "Insert",
      \ "R"      : "Replace",
      \ "Rv"     : "Virtual Replace",
      \ "c"      : "Command",
      \ "cv"     : "Vim Ex",
      \ "ce"     : "Ex",
      \ "r"      : "Prompt",
      \ "rm"     : "More",
      \ "r?"     : "Confirm",
      \ "!"      : "Shell",
      \ "t"      : "Terminal"
      \ }

function! GitInfoStatus()
  return exists('g:loaded_fugitive')&&g:loaded_fugitive&&fugitive#head()!=''?fugitive#head():''
endfunction

function! CurrentMode()
  " 3 highlighting groups
  if (mode() =~# '\v(n|no)')
    return 0
  elseif (mode() =~# '\v(i|R|Rv)')
    return 1
  elseif (mode() =~# '\v(v|V)' || mode() == "\<c-v>")
    return 2
  end
endfunction

function! ModeStatus()
  " view mode()
  " return " ".toupper(g:currentmode[mode()])."(".mode().")"." "
  " no mode()
  return " ".toupper(g:currentmode[mode()])." "
endfunction

set statusline=         " reset
set statusline+=\       " space
set statusline+=%n      " buffer number
set statusline+=%M      " modifiable/modified flag
set statusline+=%R      " Readonly flag
set statusline+=%W      " Preview window flag
set statusline+=\       " space
set statusline+=%*      " reset colour
" " Linter in statusline, only show on error
" set statusline+=%#warningmsg#
" set statusline+=%{exists('g:loaded_ale')&&g:loaded_ale?LinterStatus():''}
" set statusline+=%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
" set statusline+=%*
" file info
set statusline+=%#WarningMsg#\ %t\ %*   " file name (tail)
set statusline+=\ %{toupper(&ff)}\|     " file format, pipe
set statusline+=%{strlen(&ft)?&ft:'NA'} " file type
set statusline+=\ %<%.99{expand('%:p:h')}%{has('unix')?'\/':'\\'}   " truncate, minwidth, directory containing file ('head'), space
set statusline+=%=                      " left/right separator
" git
set statusline+=\ %{GitInfoStatus()}\   " Git branch name
" mode() indicator
set statusline+=%{CurrentMode()==0?ModeStatus():''}
set statusline+=%#ErrorMsg#%{CurrentMode()==1?ModeStatus():''}%*
set statusline+=%#Visual#%{CurrentMode()==2?ModeStatus():''}%*
" cursor
set statusline+=\ %c,   " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ (%P)  " space, percent through file, space


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
" Enable the folllow for always on Explorer
" augroup netrwExplorer
"     autocmd!
"     au VimEnter * :Vexplore!    " ! place explorer on the right
"     au VimEnter * wincmd h      " focus, h or l depends on above
" augroup END


" ale (async linting)
" let g:ale_lint_on_enter = 0               " 1
" let g:ale_lint_on_save = 0                " 0, set 1 when lint_on_text_changed is normal|never(off)
let g:ale_lint_on_text_changed = 'normal'  " always, insert, normal|never(off)
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
        " Always shows lint result
        " return l:counts.total == 0 ? 'OK' : printf(
        "             \   '%dW %dE',
        "             \   all_non_errors,
        "             \   all_errors
        "             \)
        " Only show on error
        return l:counts.total == 0 ? '' : printf(
                    \   '[%dW %dE]',
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

" sneak
let g:sneak#label = 1
 
 
" prettyprint JSON in buffer
function! Ppjson()
    %!python -m json.tool
endfunction
nmap <silent> ;pp :call Ppjson()<CR>


" switch javascript on
let g:view_as_js = 0
function! Sjs()
    if g:view_as_js == 0
        setlocal ft=javascript
        let g:view_as_js = 1
    else
        filetype detect
        let g:view_as_js = 0
    endif
endfunction
nmap <silent> ;js :call Sjs()<CR>
