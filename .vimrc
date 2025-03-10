syntax on

set encoding=UTF-8

set nocompatible

set autoindent
set cindent

set number
set tabstop=4
set shiftwidth=4
set cursorline

set history=1000

set splitright
set splitbelow
set equalalways 

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

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

let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
