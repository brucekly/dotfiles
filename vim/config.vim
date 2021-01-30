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
set lazyredraw
set list
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

" Window movement
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

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

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Aesthetic
Plug 'cocopon/iceberg.vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'

" Code
Plug 'sheerun/vim-polyglot'
Plug 'tmsvg/pear-tree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'editorconfig/editorconfig-vim'
Plug 'jpalardy/vim-slime'
Plug 'sirver/ultisnips'

" Languages
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'

call plug#end()

set termguicolors
color iceberg

" Key bindings
let mapleader="\<Space>"
let maplocalleader=","

nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>a :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>es :UltiSnipsEdit<CR>
nnoremap <leader>ev :e ~/dotfiles/vim/config.vim<CR>
nnoremap <leader>f :e<Space>
nnoremap <leader>gb :G blame<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gf :G fetch<CR>
nnoremap <leader>gg :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>i :ilist<Space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<CR>
nnoremap <leader>s vip:sort<CR>
nnoremap <leader>t :vsplit <bar> terminal<Space>
nnoremap <leader>w :call StripTrailingWhitespace()<CR>

" FZF
nnoremap <C-p> :CtrlP<CR>

" SLIME
tnoremap <Esc> <C-\><C-n>
let g:slime_target = "neovim"
let g:slime_python_ipython = 1

" VimTeX
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:vimtex_view_method='skim'

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/UltiSnips']
