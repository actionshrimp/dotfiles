[ -f ~/.env ] && source ~/.env

export COMPLETION_WAITING_DOTS="true"
export ZSH_TMUX_AUTOQUIT=false
PATH=./node_modules/.bin:$GOPATH/bin:$PATH
export GOPATH=~/.go
