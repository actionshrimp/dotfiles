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
alias gcp="git cherry-pick"


if $ISWINDOWS; then
    #Windows only stuff
    alias in='powershell -C invoke-item'
    
    alias vim="powershell -File $HOME/dotfiles/gvim-shared.ps1"
    hosts=/c/windows/system32/drivers/etc/hosts
else
    if $ISOSX; then
        alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    else
        #Unix-only stuff
        alias in=nautilus
    fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    hosts=/etc/hosts
fi


dev=~/dev
code=$dev/code
dotcom=$code/sevendigital-com
js=$dotcom/src/SevenDigital.Com.Web/Static/js
