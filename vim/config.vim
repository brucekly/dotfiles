if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jpalardy/vim-slime'
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
let &softtabstop = &tabstop
set autoindent
set backspace=indent,eol,start
set complete+=d
set foldlevelstart=999
set foldmethod=indent
set grepprg=LC_ALL=C\ grep\ -nrsH
set hidden
set ignorecase
set incsearch
set mouse=a
set noswapfile
set path& | let &path .= "**"
set ruler
set shiftround
set shiftwidth=0
set smartcase
set splitright
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmenu
set wildmode=full

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
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

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

" Status line
set laststatus=2
set statusline=%<\ %f\ %m%r%y%w%{FugitiveStatusline()}%=\ L:\ \%l\/\%L\ C:\ \%c\

let mapleader="\<Space>"
let maplocalleader=","
nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ev :e ~/dotfiles/vim/config.vim<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :grep<space>
nnoremap <leader>i :ilist<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
nnoremap <leader>s :call StripTrailingWhitespace()<cr>

let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"term_finish": "close", "vertical": 1}

let g:tex_flavor='latex'
let g:tex_no_error=1
let g:vimtex_view_method='skim'
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
