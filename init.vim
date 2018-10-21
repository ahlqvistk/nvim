" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale' "Lint engine
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy finder
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Autocomplete
Plug 'tpope/vim-repeat' "Maps '.' so plugins can use it
Plug 'tpope/vim-surround' "Surrounding shortcuts
Plug 'christoomey/vim-tmux-navigator' "Seamless vim-tmux navigation

" Syntax plugins
Plug 'hdima/python-syntax' "Enhanced Python highlighting
Plug 'pangloss/vim-javascript' "JavaScript syntax and indentation
Plug 'mxw/vim-jsx' "JSX syntax and indentation

call plug#end()

let g:python3_host_prog = '/usr/bin/python'

" Move around panes with hjkl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <BS> <c-w>h
nnoremap <c-l> <c-w>l

" Search Settings
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python setlocal ts=4 sw=4 expandtab
autocmd FileType make set noexpandtab

" gqq line breaks
set wrap
set linebreak

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line numbers
set number
set relativenumber

" Column numbers
set ruler

" Syntax highlighting
syntax on

" Hidden characters
set listchars=eol:↵,tab:➝\ ,trail:·,extends:›,precedes:‹,nbsp:⎵,conceal:%
"set list

" Change how VIM saves files for Webpack to watch
set backupcopy=yes

" CtrlP follows .gitignore
"autocmd FileType javascript
  \ let g:ctrlp_user_command =
  \ ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 0

" JSX in .js files
let g:jsx_ext_required = 0

" Deoplete
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Functions
function CheckIfFileExists(filename)
  if filereadable(a:filename)
    return 1
  endif
  return 0
endfunction

" Disable cabal_ghc and ghc linter for stack projects
if (CheckIfFileExists("./stack.yaml") == 1)
  let g:ale_linters = {
\   'haskell': ['ghc_mod', 'stack_ghc_mod', 'hdevtools', 'hie', 'hlint', 'stack-build', 'stack_ghc'],
\ }
endif

" File shortcuts
nmap <leader>i :e ~/.config/nvim/init.vim<CR>
nmap <leader>t :e ~/.config/tmux/.tmux.conf<CR>
