export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"
plugins=(
	fzf
	git
	virtualenv
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export PATH="/usr/local/sbin:$PATH"

alias brew="arch -x86_64 brew"

alias cn="vim ~/dotfiles/vim/config.vim"
alias cz="vim ~/dotfiles/config.zsh"
alias cst="vim ~/dotfiles/vim/UltiSnips/tex.snippets"

glf() {
	git l |
		fzf -i -e +s \
		--reverse \
		--tiebreak=index \
		--ansi \
		--preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
	grep -o "[a-f0-9]\{7,\}"
}
