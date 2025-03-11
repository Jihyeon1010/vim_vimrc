" ================================
" VIM CONFIGURATION
" ================================

" -----------------------
" Basic Configuration
" -----------------------
set nocompatible              " Disable legacy vi compatibility
set encoding=utf-8
set fileencoding=utf-8
set termguicolors             " True color support

set number                    " Show line numbers
set cursorline                " Highlight current line
set showcmd                  " Show incomplete commands
set showmode                 " Show current mode
set ruler                    " Show the cursor position
set hidden                   " Allow buffer switching without saving
set wildmenu                 " Enhanced command line completion
set lazyredraw               " Faster scrolling
set mouse=a                  " Enable mouse support
set clipboard=unnamedplus    " Use system clipboard
set splitbelow splitright    " Better split behavior

set tabstop=4                " Number of spaces per tab
set shiftwidth=4             " Indent width
set expandtab                " Convert tabs to spaces
set smartindent              " Smart autoindenting
set autoindent
set backspace=indent,eol,start

set scrolloff=5              " Keep context above/below cursor
set incsearch                " Search as you type
set hlsearch                 " Highlight search matches
set ignorecase smartcase     " Case-insensitive unless capitalized

set history=1000             " Command history
set undofile                 " Persistent undo
set updatetime=300           " For CursorHold events (ALE, gitgutter)

" -------------------------
" vim-plug
" -------------------------
call plug#begin('~/.vim/plugged')

" File Explorer & Icons
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'philrunninger/nerdtree-buffer-ops'

" Git Integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" nf-cod-window Appearance
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Search & Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'wsdjeg/vim-fetch'

" Editing & Productivity
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mg979/vim-visual-multi'

" Linting & Language Tools
Plug 'dense-analysis/ale'

" Yank & History
Plug 'maxbrunsfeld/vim-yankstack'

" Configuration Tools
Plug 'editorconfig/editorconfig-vim'

" Language & Syntax
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'sophacles/vim-bundle-mako'
Plug 'plasticboy/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" -------------------------------
" Theme Setup (One Dark)
" -------------------------------
syntax enable
colorscheme onedark
set background=dark

" --------------------------
"  Key Mappings
" --------------------------
let mapleader="\<Space>"

" Quick Save & Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>f :Rg<CR>

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -------------------------------
" Plugin-Specific Settings
" -------------------------------

" Lightline Theme
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" ALE settings
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

" NERDTree settings
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal

" YankStack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" --------------------------------
" Final Touch: Better Startup
" --------------------------------
if has("autocmd")
  filetype plugin indent on
  syntax enable
endif
