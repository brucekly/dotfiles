" Various settings
let &softtabstop = &tabstop
set autoindent
set backspace=indent,eol,start
set complete+=d
set foldlevelstart=999
set foldmethod=indent
set grepprg=LC_ALL=C\ grep\ -nrsH
set hidden
set hlsearch
set ignorecase
set incsearch
set mouse=a
set noswapfile
set path& | let &path .= "**"
set ruler
set shiftround
set shiftwidth=0
set smartcase
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildignorecase
set wildmenu
set wildmode=full

" Status line
set laststatus=2
set statusline=%<\ %f\ %m%r%y%w%{FugitiveStatusline()}%=\ L:\ \%l\/\%L\ C:\ \%c\ "

augroup autoSourceVimrc
  autocmd!
  autocmd bufwritepost config.vim source %
  autocmd bufwritepost init.vim source %
  autocmd bufwritepost .vimrc source %
augroup END

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Better completion menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Terminal colours
let g:terminal_color_1 = '#cf6a4c'
let g:terminal_color_2 = '#99ad6a'
let g:terminal_color_3 = '#d8ad4c'
let g:terminal_color_4 = '#597bc5'
let g:terminal_color_5 = '#a037b0'
let g:terminal_color_6 = '#71b9f8'

" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Packages
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nanotech/jellybeans.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

set termguicolors
color jellybeans

" Key bindings
let mapleader="\<Space>"
let maplocalleader=","

nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>a :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>
nnoremap <leader>b :b <C-d>
nnoremap <leader>ee :edit<Space>
nnoremap <leader>es :UltiSnipsEdit<CR>
nnoremap <leader>ev :e ~/dotfiles/vim/config.vim<CR>
nnoremap <leader>f :find<Space>*
nnoremap <leader>gb :G blame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gf :G fetch<CR>
nnoremap <leader>gg :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>i :ilist<Space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<CR>
nnoremap <leader>s vip:sort<CR>
nnoremap <leader>tc :Tclose<Space>
nnoremap <leader>tl :Tclear<CR>
nnoremap <leader>tn :Tnew<CR>
nnoremap <leader>tt :T<Space>
nnoremap <leader>w :call StripTrailingWhitespace()<CR>
nnoremap <silent><leader>R :TREPLSendFile<CR>
nnoremap <silent><leader>r :TREPLSendLine<CR>j
vnoremap <silent><leader>r :TREPLSendSelection<cr>'>j

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_direct_open_repl = 1
let g:neoterm_default_mod = 'vertical'
let g:neoterm_repl_enable_ipython_paste_magic = 1

" VimTeX
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:vimtex_view_method='skim'
nnoremap <localleader>lt :call vimtex#fzf#run()<CR>

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/UltiSnips']
