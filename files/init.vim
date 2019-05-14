set nocompatible
filetype off

call plug#begin("~/.nvim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

call plug#end()

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1
