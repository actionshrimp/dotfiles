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
[ -f ~/.env ] && source ~/.env

export PATH=./node_modules/.bin:$PATH
[[ $TERM == eterm-color ]] && export TERM=xterm

if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi
