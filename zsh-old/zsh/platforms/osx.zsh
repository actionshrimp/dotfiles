antigen bundle osx

#Requires brew install coreutils
alias ls="gls --color=auto"
eval `gdircolors ~/dotfiles/dircolors`

source <(kubectl completion zsh)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/*.zsh.inc
