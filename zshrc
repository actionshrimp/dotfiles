source ~/dotfiles/zsh/platform.zsh
source ~/dotfiles/zsh/settings.zsh
source ~/dotfiles/zsh/antigen.zsh
source ~/dotfiles/zsh/bundle.zsh

source ~/dotfiles/zsh/scripts/sane-completion.zsh
source ~/dotfiles/zsh/scripts/fzf.zsh

source ~/dotfiles/zsh/aliases.zsh

if [[ $platform == "linux" ]]; then
    source ~/dotfiles/zsh/platforms/linux.zsh
fi

if [[ $platform == "osx" ]]; then
    source ~/dotfiles/zsh/platforms/osx.zsh
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[[ $TERM == eterm-color ]] && export TERM=xterm

if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

#export PATH="$HOME/.rbenv/bin:$PATH"
#if type "rbenv" > /dev/null; then
#      eval "$(rbenv init -)"
#fi

# added by travis gem
[ -f /Users/dave/.travis/travis.sh ] && source /Users/dave/.travis/travis.sh

source <(kubectl completion zsh)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/*.zsh.inc

export KUBE_EDITOR=vim
