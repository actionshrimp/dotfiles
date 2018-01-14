# brew install zplug / aura -As zplug

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

#fzf_platform='*darwin*amd64*'
#if [[ $(uname) == 'Linux' ]]; then
#    fzf_platform='*linux*amd64*'
#fi
#zplug "junegunn/fzf-bin", \
#      from:gh-r, \
#      as:command, \
#      rename-to:fzf, \
#      use:"${fzf_platform}"
#unset fzf_platform

if ! [[ -f ~/.fzf.zsh ]] ; then
    if ! [[ -f ~/.fzf/install ]] ; then
        rm -rf ~/.fzf
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    fi
    ~/.fzf/install --all
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
HISTFILE=.zhistory
source ~/.fzf.zsh
