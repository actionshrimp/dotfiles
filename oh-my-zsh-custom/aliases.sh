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

if [[ $platform == 'linux' ]]; then
    alias in=gnome-open
elif [[ $platform == 'osx' ]]; then
    alias in=open
fi

hosts=/etc/hosts

dev=~/dev
code=$dev/code
dotcom=$code/sevendigital-com
js=$dotcom/src/SevenDigital.Com.Web/Static/js
