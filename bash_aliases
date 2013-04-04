alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gpush="git push"


if [ $ISWINDOWS == true ]; then
    #Windows only stuff
    alias vim="powershell -File $HOME/dotfiles/gvim-shared.ps1"
    alias in='powershell -C invoke-item'

    iislogs=/c/inetpub/logs/logfiles

else
    #Unix-only stuff
    alias in=nautilus

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

dev=~/dev
code=$dev/code
