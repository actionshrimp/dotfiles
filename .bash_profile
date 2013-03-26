# Prompt
PS1='\[\033]0;$MSYSTEM:\w\007
\033[31m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
$ '

# Ignore .suo from tab completion
FIGNORE=$FIGNORE:.suo

set -o vi

# Aliases
alias in=nautilus
alias lsl="ls -l"

alias gs="git status"
alias gc="git commit"
