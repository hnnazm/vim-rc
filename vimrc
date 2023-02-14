set hidden
set confirm
set showtabline=2
set switchbuf=usetab,newtab

set encoding=utf-8

set nobackup
set nowritebackup

set clipboard=unnamedplus

syntax on
filetype plugin indent on

set background=dark
colorscheme retrobox

set number
set relativenumber
set numberwidth=4

set showcmd
set showmode
set cursorline
set cursorcolumn

set wrap

set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 

set foldmethod=expr
" set foldexpr=vim.cmd("call nvim_treesitter#foldexpr()")
set nofoldenable

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
set path+=$PWD/**
set wildignore+=*/node_modules/*

set wildmenu
set wildmode=longest,full

set pumheight=10

let g:mapleader = " "
let g:localmapleader = "\\"

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

function! CustomLex()
  try
    silent Lex! %:h
  catch /E499:/
    Lex!
  endtry
endfunction

nnoremap <Leader>ff <Cmd>call CustomLex()<CR>
nnoremap <Leader>fb <Cmd>buffers<CR>:buffer 

nnoremap <C-k> <Cmd>bprevious<CR>
nnoremap <C-j> <Cmd>bnext<CR>
nnoremap <Tab> <Cmd>buffer #<CR>
nnoremap <C-x>b <Cmd>bprevious<CR><Cmd>bdelete #<CR>

nnoremap <C-h> <Cmd>tabprevious<CR>
nnoremap <C-l> <Cmd>tabnext<CR>
nnoremap <C-x>t <Cmd>tabclose<CR>

nnoremap <BS> <Cmd>nohlsearch<CR>

vnoremap p "_dP

tnoremap <Esc><Esc> <C-\><C-n>

let g:netrw_banner          = 0
let g:netrw_banner          = 0
let g:netrw_winsize         = 30
let g:netrw_wiw             = 1
let g:netrw_usetab          = 1
let g:netrw_browse_split    = 0
let g:netrw_alto            = 1
let g:netrw_altv            = 1
let g:netrw_liststyle       = 0
let g:netrw_altfile         = 0   " Set to 0 for saner behavior for Lex
let g:netrw_cursor          = 4
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

"set statusline = statusline
"set laststatus = 3
"set showmode = 0
"
"local function update_statusline()
"  local function git_branch()
"    local branch = vim.api.nvim_call_function("system", {"git rev-parse --abbrev-ref HEAD 2>/dev/null"})
"    if branch == "" then
"      return ""
"    else
"      return "[" .. branch .. "]"
"    end
"  end
"
"  local cwd = vim.fn.getcwd()
"  local filename = vim.fn.expand("%:t")
"  local git_info = git_branch()
"
"  local statusline = git_info .. " " .. "%=" .. filename .. "%=" .. " " .. cwd 
"
"  set statusline = statusline
"end
"local StatusLine = vim.api.nvim_create_augroup("StatusLine", { clear = true })
"vim.api.nvim_create_autocmd({ "BufEnter" }, {
"  pattern = "*",
"  group = StatusLine,
"  callback = update_statusline
"})

augroup VisualRuler
  autocmd!
  autocmd InsertEnter * set nocursorline nocursorcolumn
  autocmd InsertLeave * set cursorline cursorcolumn
  autocmd FileType netrw set nocursorline nocursorcolumn
augroup END

augroup Netrw
  autocmd!
  autocmd FileType netrw normal :lcd! %:h<CR>
  autocmd FileType netrw nnoremap <LocalLeader><LocalLeader> <Plug>NetrwShrink
augroup END

" COC Configurations
" Ensure intall this extension
let g:coc_global_extensions = ['coc-json', 'coc-git']

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
