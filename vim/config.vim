set nocompatible

set runtimepath^=~/dotfiles/vim

if empty(glob('~/dotfiles/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim-plugins')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'sirver/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'
Plug 'chrisbra/csv.vim'

call plug#end()

set showmatch
set ignorecase 
set smartcase
set linebreak
set nobackup
set nowritebackup
set noswapfile
set shortmess+=c

augroup autoSourceVimrc
  au!
  au bufwritepost config.vim source ~/dotfiles/vim/config.vim
  au bufwritepost config.vim call lightline#highlight()
augroup END

color solarized

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

nnoremap <C-p> :FZF<CR>

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

let mapleader=" "
let maplocalleader=","

nnoremap <leader>ev :e ~/dotfiles/vim/config.vim<CR>
nnoremap <leader>est :e ~/dotfiles/vim/UltiSnips/tex.snippets<CR>

let g:tex_flavor='latex'
let g:tex_no_error=1
let g:vimtex_view_method='skim'
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

