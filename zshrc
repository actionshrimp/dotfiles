# Path to default oh-my-zsh checkout folder and custom config folder
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME="actionshrimp"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git tmux npm web-search vi-mode zsh-syntax-highlighting)

# Plugin settings
export ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl

eval `dircolors ~/.dircolors`
