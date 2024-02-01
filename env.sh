#!/bin/zsh

# Add commonly used folders to $PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Example aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias g='git'

# Re source Zsh
alias zsrc='omz reload'
alias zenv='vim ~/.oh-my-zsh/env.sh'
alias zgit='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# See aliases
alias cenv='cat ~/.oh-my-zsh/env.sh'
alias cgit='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# Tooling Aliases
alias nrw='npm run watch'
alias bds='bin/deploy sandbox / dev'
alias nrl='npm run lint'
alias nrlj='npm run lint:js'

# ----------------------
# CD Aliases
# ----------------------
alias vol='cd ~/Volumes'
alias sites='cd ~/Volumes/Sites'
alias tool='cd ~/Volumes/Tools'
alias third='cd ~/Volumes/third'
alias wil='cd ~/Volumes/Sites/wil'
alias dci='cd ~/Volumes/Sites/dci'
alias aa='cd ~/Volumes/Tools/serverless/authalert'
alias uec='cd ~/Volumes/Sites/uec'
alias lc='cd ~/Volumes/Sites/lc'
alias snp='cd ~/Volumes/Sites/snp'
alias snpdata='cd ~/Volumes/Sites/snpdata'
alias sir='cd ~/Volumes/Sites/shopify-integration-refapp'
alias web='cd ~/Volumes/Sites/web'
alias cl='cd ~/Volumes/Sites/clsfcc'
alias webs='cd ~/Volumes/Sites/web-shared'
alias githelp='cat /Users/miketay/.oh-my-zsh/plugins/git/git.plugin.zsh'

# ----------------------
# IDE functions
# ----------------------
funciton ws () {
    open -na "WebStorm.app" --args "$1";
}

funciton vs () {
 open -na "Visual Studio Code.app" --args "$1";
}

