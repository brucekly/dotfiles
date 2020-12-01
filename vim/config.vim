if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'wesgibbs/vim-irblack'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'

call plug#end()

" Various settings
set autoindent
set backspace=indent,eol,start
set complete+=d
set foldlevelstart=999
set foldmethod=indent
set grepprg=LC_ALL=C\ grep\ -nrsH
set hidden
set incsearch
set mouse=a
set noswapfile
set path& | let &path .= "**"
set ruler
set shiftround
set shiftwidth=0
let &softtabstop = &tabstop
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmenu
set wildmode=full

" Jumps
nnoremap ' `

" Search and replace
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/g
nnoremap <Space>% :%s/\<<C-r>=expand("<cword>")<CR>\>/g

" Better completion menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap ,, <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,f <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>

" Lightweight pair expansion
inoremap (<CR> (<CR>)<Esc>O
inoremap (;    (<CR>);<Esc>O
inoremap (,    (<CR>),<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {;    {<CR>};<Esc>O
inoremap {,    {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [;    [<CR>];<Esc>O
inoremap [,    [<CR>],<Esc>O

augroup autoSourceVimrc
  autocmd!
  autocmd bufwritepost config.vim source %
  autocmd bufwritepost init.vim source %
  autocmd bufwritepost .vimrc source %
augroup END

color ir_black

" Status line
set laststatus=2
set statusline=%<\ %f\ %m%r%y%w%{FugitiveStatusline()}%=\ L:\ \%l\/\%L\ C:\ \%c\ 

nnoremap <C-p> :Files<CR>

let mapleader="\<Space>"
let maplocalleader=","

nnoremap <leader>ev :e ~/dotfiles/vim/config.vim<CR>

let g:tex_flavor='latex'
let g:tex_no_error=1
let g:vimtex_view_method='skim'
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

