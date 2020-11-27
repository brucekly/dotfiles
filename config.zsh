export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"
plugins=(
    fzf
    git
    virtualenv
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

alias brew="arch -x86_64 brew"

alias g="git"

alias n="nvim"
alias cn="nvim ~/dotfiles/vim/config.vim"
alias cz="nvim ~/dotfiles/config.zsh"
alias cst="nvim ~/dotfiles/vim/UltiSnips/tex.snippets"
