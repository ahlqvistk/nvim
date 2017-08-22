"Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale' "Lint engine
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy finder
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Autocomplete
Plug 'Shougo/neosnippet.vim' "Snippet plugin
Plug 'pangloss/vim-javascript' "JavaScript syntax and indentation
Plug 'mxw/vim-jsx' "JSX syntax and indentation
Plug 'christoomey/vim-tmux-navigator' "Seamless vim-tmux navigation

call plug#end()

"Move around panes with hjkl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Search Settings
set incsearch
set hlsearch

"Indentation
set tabstop=2
set shiftwidth=2
set expandtab

autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

"Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Line numbers
set number
set relativenumber

"Syntax highlighting
syntax on

"Change how VIM saves files for Webpack to watch
set backupcopy=yes

"CtrlP follows .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"JSX in .js files
let g:jsx_ext_required = 0

"Deoplete
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 

"Neosnippet
imap <expr><TAB>
  \ neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" :
  \ pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"File shortcuts
nmap <leader>i :e ~/.config/nvim/init.vim<CR>
nmap <leader>h :e ~/.config/nvim/snippets/html.snippets<CR>
nmap <leader>j :e ~/.config/nvim/snippets/javascript.snippets<CR>
nmap <leader>t :e ~/.config/tmux/.tmux.conf<CR>
