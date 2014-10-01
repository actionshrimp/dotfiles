export FZF_DEFAULT_COMMAND="find * -path '*/\\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
