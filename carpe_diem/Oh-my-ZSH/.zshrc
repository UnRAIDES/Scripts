# This is your .zshrc, put it in /boot/config/extra/

ZSH_DISABLE_COMPFIX=true
export ZSH="/root/.oh-my-zsh"

ZSH_THEME="agnoster" #Change theme if desired

DISABLE_UPDATE_PROMPT="true"

# Plugings installed to ZSH. You can delete what you don't want or add your own here
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  copypath
  copyfile
  dirhistory
  history
)

source $ZSH/oh-my-zsh.sh

# User configurations

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
# alias ll="eza --long --all --icons --group" # ll alias for use if eza is installed. Remove initial # in this line to activate

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/root/.cache/zsh/history