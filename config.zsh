export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"
plugins=(
	fzf
	git
	virtualenv
)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export PATH="/usr/local/sbin:$PATH"

alias brew="arch -x86_64 brew"

alias cn="vim ~/dotfiles/vim/config.vim"
alias cz="vim ~/dotfiles/config.zsh"
alias cst="vim ~/dotfiles/vim/UltiSnips/tex.snippets"

fl() {
  git l |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		--preview \
		'grep -o "[a-f0-9]\{7,\}" <<< {} |
		xargs git show --color=always |
		head -'$LINES \
		--bind "ctrl-m:execute:
							(grep -o '[a-f0-9]\{7\}' | head -1 |
							xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
							{}
FZF-EOF" \
		--bind 'ctrl-y:execute-silent(grep -o "[a-f0-9]\{7\}" <<< {} | pbcopy)+abort'
}

function __gi() {
  curl -L -s https://www.gitignore.io/api/"$@"
}

gi() {
	if  [ "$#" -eq 0 ]; then
		IFS+=","
		for item in $(__gi list); do
			echo $item
		done | fzf --multi --ansi | paste -s -d "," - |
			{ read result && __gi "$result"; }
		else
			__gi "$@"
	fi
}
