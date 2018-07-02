# brew install zplug / aura -As zplug

# This needs to come before zsh-syntax-highlighting for some reason
autoload -U select-word-style
select-word-style bash

if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

SPACESHIP_TIME_SHOW=true
if [[ $(uname) == 'Darwin' ]]; then
    SPACESHIP_CHAR_SYMBOL=">"
    SPACESHIP_CHAR_SUFFIX=" "
fi
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

fzf_platform='*darwin*amd64*'
if [[ $(uname) == 'Linux' ]]; then
    fzf_platform='*linux*amd64*'
fi
zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"${fzf_platform}"
unset fzf_platform
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"

if [[ $(uname) == 'Darwin' ]]; then
    zplug "plugins/gpg-agent", from:oh-my-zsh
fi

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Temporary workaround for zplug bug
PATH=$ZPLUG_BIN:$PATH

# Then, source plugins and add commands to $PATH
zplug load

FZF_TMUX=1
zle     -N   fzf-file-widget
bindkey '^T' fzf-file-widget
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt inc_append_history share_history

alias gs="git status"
alias gc="git commit"
alias gp="git pull"
alias gl="git log"
alias gd="git diff"
alias gdc="git diff --cached"
alias glg="git log --pretty=oneline --decorate --graph --abbrev-commit"
alias gco="git checkout"

#kubectl config set-context dev-imarkets --cluster gke_imandra-dev_europe-west1-c_imandra-markets-dev-cluster --user gke_imandra-dev_europe-west1-c_imandra-markets-dev-cluster
#kubectl config set-context dev-try1 --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster --namespace try1
#kubectl config set-context dev-try2 --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster --namespace try2
alias kube-dev-imkts="kubectl config use-context dev-imarkets"
alias kube-dev-try1="kubectl config use-context dev-try1"
alias kube-dev-try2="kubectl config use-context dev-try2"

#kubectl config set-context prod-imarkets --cluster gke_imandra-prod_europe-west1-c_imandra-markets-prod-cluster --user gke_imandra-prod_europe-west1-c_imandra-markets-prod-cluster
#kubectl config set-context prod-try1 --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster
#kubectl config set-context prod-try2 --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster
alias kube-prod-imkts="kubectl config use-context prod-imarkets"
alias kube-prod-try1="kubectl config use-context prod-try1"
alias kube-prod-try2="kubectl config use-context prod-try2"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


if [[ -x "$(command -v kubectl)" ]]; then
    source <(kubectl completion zsh)
fi

if [[ $(uname) == 'Darwin' ]]; then
    [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

if [[ $(uname) == 'Linux' ]]; then
    export npm_config_prefix=~/.node_modules
fi

# This is to keep emacs happy on osx
[ -f ~/.bash_profile ] && [[ $(uname) != 'Linux' ]] && source ~/.bash_profile
