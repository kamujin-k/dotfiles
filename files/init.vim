set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin("~/.nvim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

call plug#end()
