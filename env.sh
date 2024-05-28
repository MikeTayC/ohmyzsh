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
alias venv="vim $ZSH/env.sh"

# See aliases
alias cenv="cat $ZSH/env.sh"
alias cgit="cat $ZSH/custom/git.zsh"

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


# ----------------------
# IDE functions
# ----------------------
funciton vs () {
 open -na "Visual Studio Code.app" --args "$1";
}

