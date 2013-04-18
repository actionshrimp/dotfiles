if $ISOSX; then
  alias ls='ls -Gp'
else
  alias ls='ls -p --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias g="git"
alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gpush="git push"
alias gco="git checkout"


if [ $ISWINDOWS == true ]; then
    #Windows only stuff
    alias in='powershell -C invoke-item'
    
    alias vim="powershell -File $HOME/dotfiles/gvim-shared.ps1"
else
    #Unix-only stuff
    alias in=nautilus

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

dev=~/dev
code=$dev/code
dotcom=$code/sevendigital-com
