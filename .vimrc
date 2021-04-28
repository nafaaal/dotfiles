set rnu
set autoindent
set ruler
set showcmd
set tabstop=2 shiftwidth=2 expandtab
call plug#begin('~/.vim/plugged')
Plug 'sindresorhus/pure'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:airline_theme='jellybeans'
syntax on
colorscheme pablo
