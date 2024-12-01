#!/bin/zsh

# Add commonly used folders to $PATH
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Example aliases
alias g='git'

# Re source Zsh
alias zsrc='omz reload'
alias cleanzsrc="rm $ZSH_COMPDUMP && zsrc"

alias venv="vim $ZSH/env.sh"
alias vohmy="vim $ZSH/oh-my-zsh.sh"
alias vsrc="vim ~/.zshrc"

# See aliases
alias cenv="cat $ZSH/env.sh"
alias cgit="cat $ZSH/custom/git.zsh"
alias czsrc="cat ~/.zshrc"
alias cohmy="cat $ZSH/oh-my-zsh.sh"

# Tooling Aliases
alias nrw='npm run watch'
alias bds='bin/deploy sandbox / dev'
alias nrl='npm run lint'
alias nrlj='npm run lint:js'

# ----------------------
# CD Aliases
# ----------------------
alias sites='cd ~/Volumes/Sites'
alias tool='cd ~/Volumes/Tools'
alias wil='cd ~/Volumes/Sites/wil'
alias lc='cd ~/Volumes/Sites/lc'
alias snp='cd ~/Volumes/Sites/snp'
alias web='cd ~/Volumes/Sites/web'
alias ohmyz="cd $ZSH"

# ----------------------
# IDE functions
# ----------------------
funciton vs () {
 open -na "Visual Studio Code.app" --args "$1";
}

function zshdumptest () {
  setopt LOCAL_OPTIONS extendedglob
  for dump in ~/.cache/zsh/zcompdump/.zcomdump*(N.ms+10); do
    echo "reg compinit"
  done
  echo "compinit -C"
}
