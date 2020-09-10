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
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

SPACESHIP_TIME_SHOW=true
if [[ $(uname) == 'Darwin' ]]; then
    SPACESHIP_CHAR_SYMBOL=">"
    SPACESHIP_CHAR_SUFFIX=" "
    SPACESHIP_DOCKER_SHOW=false
    SPACESHIP_NODE_SHOW=false
    #SPACESHIP_GIT_SHOW=false
    #SPACESHIP_GIT_BRANCH_SHOW=false
    SPACESHIP_KUBECONTEXT_SHOW=false
fi
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

fzf_platform='*darwin*amd64*'
if [[ $(uname) == 'Linux' ]]; then
    fzf_platform='*linux*amd64*'
fi
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

alias k="kubectl"
alias kc="kubectl config use-context"
alias kcc="kubectl config current-context"
alias wk="watch kubectl"

#gcloud container clusters --project imandra-dev get-credentials     --region europe-west1-c imandra-markets-dev-cluster
#gcloud container clusters --project imandra-dev get-credentials     --region europe-west1-c try-imandra-dev-cluster

#gcloud container clusters --project imandra-prod get-credentials    --region europe-west1-c imandra-markets-prod-cluster
#gcloud container clusters --project imandra-prod get-credentials    --region europe-west1-c prod-tryimandra-try1-cluster
#gcloud container clusters --project imandra-prod get-credentials    --region europe-west1-c prod-tryimandra-try2-cluster

#gcloud container clusters --project imandra-gs-prod get-credentials --region europe-west2-a imandra-gs-prod-cluster

#gcloud container clusters --project imandra-prod get-credentials    --region europe-west1-c prod-imandracore-europe-west1-cluster
#gcloud container clusters --project imandra-prod get-credentials    --region us-central1-c  prod-imandracore-us-central1-cluster

#kubectl config set-context dev-imarkets  --cluster gke_imandra-dev_europe-west1-c_imandra-markets-dev-cluster   --user gke_imandra-dev_europe-west1-c_imandra-markets-dev-cluster
#kubectl config set-context dev-try1      --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --namespace try1
#kubectl config set-context dev-try2      --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --namespace try2
#kubectl config set-context dev-core1     --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --namespace core1
#kubectl config set-context prod-imarkets --cluster gke_imandra-prod_europe-west1-c_imandra-markets-prod-cluster --user gke_imandra-prod_europe-west1-c_imandra-markets-prod-cluster
#kubectl config set-context prod-try1     --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster
#kubectl config set-context prod-core1    --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try1-cluster --namespace core1
#kubectl config set-context prod-try2     --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster
#kubectl config set-context prod-core2    --cluster gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster --user gke_imandra-prod_europe-west1-c_prod-tryimandra-try2-cluster --namespace core2

#kubectl config set-context prod-gs       --cluster gke_imandra-gs-prod_europe-west2-a_imandra-gs-prod-cluster   --user gke_imandra-gs-prod_europe-west2-a_imandra-gs-prod-cluster

#kubectl config set-context dev-core1     --cluster gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --user gke_imandra-dev_europe-west1-c_try-imandra-dev-cluster       --namespace core1
#kubectl config set-context prod-core-europe-west1     --cluster gke_imandra-prod_europe-west1-c_prod-imandracore-europe-west1-cluster --user gke_imandra-prod_europe-west1-c_prod-imandracore-europe-west1-cluster
#kubectl config set-context prod-core-us-central1      --cluster gke_imandra-prod_us-central1-c_prod-imandracore-us-central1-cluster --user gke_imandra-prod_us-central1-c_prod-imandracore-us-central1-cluster
#kubectl config set-context local-core1 --cluster docker-desktop --namespace core1 --user docker-desktop

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

if [[ $(uname) == 'Darwin' ]]; then
    [ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/ ] && export PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/:$PATH
    [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

if [[ -x "$(command -v kubectl)" ]]; then
    source <(kubectl completion zsh)
fi

if [[ $(uname) == 'Linux' ]]; then
    export npm_config_prefix=~/.node_modules
fi

# This is to keep emacs happy on osx
[ -f ~/.bash_profile ] && [[ $(uname) != 'Linux' ]] && source ~/.bash_profile
