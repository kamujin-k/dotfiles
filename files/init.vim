set nocompatible
filetype off

call plug#begin("~/.nvim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1
set number " enable line numbers
set mouse=a

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F3> " enable paste mode (more on this below)

" set indent for 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap d "_d
vnoremap d "_d

nnoremap y "+y
vnoremap y "+y

