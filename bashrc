export GOPATH=~/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

# aliases
alias vi='vim'
alias e='vim'
alias i='git status --short'
alias g='lazygit'

case "${OSTYPE}" in
	darwin*)
		alias ls="ls -G"
		alias l_zqx="ls -alG"

		alias tac="tail -r"
		;;
	linux*)
		alias ls="ls --color"
		alias l_zqx="ls -al --color"
		;;
esac

# functions (mainly with fzf)
t_zqx() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
	cd "$dir"
}

ta_zqx() {
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

g_zqx() {
	local dir
	dir=$(ghq list --full-path | fzf) && cd "$dir"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
