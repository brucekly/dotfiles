export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"
plugins=(
	fzf
	git
	virtualenv
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_COMMAND="fd -t f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
alias ls="ls --color=always"

export EDITOR=nvim
export PATH="/usr/local/sbin:$PATH"

alias brew="arch -x86_64 brew"
alias cdd="cd ~/dotfiles"
alias n="nvim"

c() {
	local dir="$(fd -t d . ~/code -d 1 | fzf --height 6)"
	if [ ! -z $dir ]; then
		cd $dir
	fi
}

d() {
	local file="$(fd -t f . ~/dotfiles | fzf --height 6)"
	if [ ! -z $file ]; then
		$EDITOR $file
	fi
}

fl() {
  git l |
  fzf --ansi --no-sort --reverse --tiebreak=index \
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
