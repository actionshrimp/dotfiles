# Path to default oh-my-zsh checkout folder and custom config folder
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME="actionshrimp"
TERM="screen-256color"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git tmux npm web-search zsh-syntax-highlighting grunt)

# Plugin settings
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=false

source-if-exists(){ [[ -r "$1" ]] && source "$1"; true }

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/platform.sh
source $ZSH_CUSTOM/aliases.sh
source-if-exists ~/.env
setopt APPEND_HISTORY

# Customize to your needs...
export CHROME_BIN=google-chrome-stable
export GEM_HOME=~/.gem/ruby/2.0.0
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/dave/.gem/ruby/2.0.0/bin

eval `dircolors ~/.dircolors`

#Disable Ctrl-S terminal 'freeze' escape character
stty -ixon

function scroll-natural() {
    xmodmap ~/.config/xmodmap/scroll-natural
}

function scroll-normal() {
    xmodmap ~/.config/xmodmap/scroll-normal
}

setopt menu_complete
