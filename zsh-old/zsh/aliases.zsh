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
alias glg="git log --pretty=oneline --decorate --graph --abbrev-commit"

function kh {
  sed -i '' "$1d" ~/.ssh/known_hosts
}

function plot-uptime {
  interval -t "$1" "curl -H \"User-Agent: twitterbot\" --connect-timeout 5 -so /dev/null -w \"%{http_code}\n\" $2" | plot
}

alias vim=nvim
