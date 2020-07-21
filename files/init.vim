
filetype off

call plug#begin("~/.nvim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'laher/fuzzymenu.vim'

call plug#end()


" ####################################
" settings
" ####################################

set background=dark " for the dark version
syntax enable
colorscheme nord

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1
set number " enable line numbers
set mouse=a

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F3> " enable paste mode (more on this below)

" Incrementally search while typing
set incsearch
" Use smart case for searching
set ignorecase
set smartcase

" set indent for 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" ####################################
" mappings
" ####################################

nmap <C-p> <Plug>Fzm
vmap <C-p> <Plug>FzmVisual

" Make easy editing and sourcing vimrc
command! RefreshConfig source $MYVIMRC <bar> echo "Refreshed vimrc!"

" <Leader> ev for edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" <Leader> sv for sourcing vimrc
nnoremap <leader>rv :RefreshConfig<cr>

map <Space> <Leader>

nnoremap <Leader>/ :%s/

" copy text...
nnoremap y "+y
vnoremap y "+y

" DELETES text!
nnoremap d "_d
vnoremap d "_d

" changes text WITHOUT copying!
nnoremap c "_c
vnoremap c "_c

" CUTS text!
nnoremap x "+d
vnoremap x "+d

" Clear search highlights
nnoremap <Leader><Space> :noh<CR>

nnoremap <C-Tab> :tabn<cr>
nnoremap <C-S-Tab> :tabp<cr>

" navigate to beginning of line
nnoremap H ^

" navigate to end of line
nnoremap L $

" navigate to next paragraph
nnoremap J }

" navigate to previous paragraph
nnoremap K {


" go back in jump list
nnoremap <A-h> <C-o>

" go forwards in jump list
nnoremap <A-l> <C-i>

" ####################################
" coc.nvim
" ####################################

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" show completion on cursor
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" code actions on cursor
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" ####################################
" end coc.nvim
" ####################################


if executable('fzf')
  " FZF {{{
  
  "Let the input go up and the search list go down
  let $FZF_DEFAULT_OPTS = '--layout=reverse'

  "Open FZF and choose floating window
  let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


    function! OpenFloatingWin()
      let height = &lines - 3
      let width = float2nr(&columns - (&columns * 2 / 10))
      let col = float2nr((&columns - width) / 2)

      "Set the position, size, etc. of the floating window.
      "The size configuration here may not be so flexible, and there's room for further improvement.
      let opts = {
            \ 'relative': 'editor',
            \ 'row': height * 0.3,
            \ 'col': col + 30,
            \ 'width': width * 2 / 3,
            \ 'height': height / 2
            \ }

      let buf = nvim_create_buf(v:false, v:true)
      let win = nvim_open_win(buf, v:true, opts)

      "Set Floating Window Highlighting
      call setwinvar(win, '&winhl', 'Normal:Pmenu')

      setlocal
            \ buftype=nofile
            \ nobuflisted
            \ bufhidden=hide
            \ nonumber
            \ norelativenumber
            \ signcolumn=no
    endfunction

 " <C-p> or <C-t> to search files
 nnoremap <silent> <C-t> :FZF -m<cr>

 " <M-p> for open buffers
 nnoremap <silent> <M-p> :Buffers<cr>

 " <M-S-p> for MRU
 nnoremap <silent> <M-S-p> :History<cr>

 " Use fuzzy completion relative filepaths across directory
 imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

 " Better command history with q:
 command! CmdHist call fzf#vim#command_history({'right': '40'})
 nnoremap q: :CmdHist<CR>

 " Better search history
 command! QHist call fzf#vim#search_history({'right': '40'})
 nnoremap q/ :QHist<CR>


 command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
  " }}}
else
  " CtrlP fallback
end

