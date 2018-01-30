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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


if [[ -x "$(command -v kubectl)" ]]; then
    source <(kubectl completion zsh)
fi

if [[ $(uname) == 'Linux' ]]; then
    export npm_config_prefix=~/.node_modules
fi

# This is to keep emacs happy on osx
[ -f ~/.bash_profile ] && [[ $(uname) != 'Linux' ]] && source ~/.bash_profile
