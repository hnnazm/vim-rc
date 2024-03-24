let g:mapleader = " "
let g:maplocalleader = "\\"

set nocompatible
set hidden
set confirm

set clipboard^=unnamed

set encoding=utf-8

set nobackup
set nowritebackup

syntax on
filetype plugin indent on

if v:version >= 900
  colorscheme retrobox
  set background=dark
endif

set showtabline=2
set switchbuf=usetab,newtab

set laststatus=2

set number
set relativenumber
set numberwidth=4

set showcmd
set showmode

set wrap

set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 

set splitbelow
set splitright

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround

set hlsearch
set incsearch
set nowrapscan

set updatetime=300
set ttimeout
set ttimeoutlen=300
set timeout
set timeoutlen=300

" set autochdir

set shortmess+=cI
set wildignore+=*/node_modules/*

set wildmenu
set wildmode=longest,full

if v:version >= 901
  set wildoptions=pum,fuzzy
endif

set pumheight=10

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap <C-k> <Cmd>bprevious<CR>
nnoremap <C-j> <Cmd>bnext<CR>
nnoremap <Tab> <Cmd>buffer #<CR>
nnoremap <C-x><C-x> <Cmd>bprevious<CR><Cmd>bdelete #<CR>

nnoremap <C-h> <Cmd>tabprevious<CR>
nnoremap <C-l> <Cmd>tabnext<CR>
nnoremap <C-x><C-t> <Cmd>tabclose<CR>

nnoremap <Leader>o :<C-u>find 
nnoremap <Leader>i :<C-u>buffer 

nnoremap <BS> <Cmd>nohlsearch<CR>

vnoremap p "_dP

tnoremap <Esc><Esc> <C-\><C-n>

let g:netrw_banner          = 0
let g:netrw_winsize         = 30
let g:netrw_wiw             = 1
let g:netrw_usetab          = 1
let g:netrw_browse_split    = 0
let g:netrw_alto            = 1
let g:netrw_altv            = 1
let g:netrw_liststyle       = 0
let g:netrw_altfile         = 1   " Set to 0 for saner behavior for Lex
let g:netrw_keepdir         = 1
let g:netrw_dirhistmax      = 0
let g:netrw_browsex_viewer  = "open"
let g:netrw_sort_by         = "exten"
let g:netrw_sort_direction  = "normal"
let g:netrw_sort_options    = "i"
let g:netrw_list_hide       = netrw_gitignore#Hide()
let g:netrw_list_hide       = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_chgwin          = 1

nnoremap <LocalLeader>s <Cmd>w<CR><Cmd>source %<CR>

function! Netrw()
  if &ft == "netrw"
    if exists("w:netrw_rexlocal")
      Rexplore
    else
      if exists("w:netrw_rexfile")
        exec 'e ' . w:netrw_rexfile
      endif
    endif
  else
    Explore
  endif
endfunction

nnoremap <Leader>g <Cmd>call Netrw()<CR>

function! SetNewPath()
  let l:new_path = '.,' . $PWD . '/**,' . ',,'
  execute 'set path=' . l:new_path
endfunction

" Call the function when Vim starts
autocmd VimEnter * call SetNewPath()


function! VisualRuler()
  set cursorcolumn! cursorline!
endfunction

nnoremap <LocalLeader>r <Cmd>call VisualRuler()<CR>
