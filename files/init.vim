set nocompatible
filetype off

call plug#begin("~/.nvim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'

call plug#end()

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1

nnoremap d "_d
vnoremap d "_d

nnoremap y "+y
vnoremap y "+y
