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

# fuzzy history
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fuzzy dir
#:fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fuzzy ch - browse chrome history
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Re source Zsh
alias zsrc='source ~/.zshrc'
alias zenv='vim ~/.oh-my-zsh/env.sh'



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
alias sfcc='cd ~/Volumes/Sites/sfcc'
alias lc='cd ~/Volumes/Sites/lc'
alias snp='cd ~/Volumes/Sites/snp'
alias snpdata='cd ~/Volumes/Sites/snpdata'
alias sir='cd ~/Volumes/Sites/shopify-integration-refapp'
alias web='cd ~/Volumes/Sites/web'

# git aliases

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gdc='git diff --cached'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias ghist='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git restore'
alias gra='git restore .'
alias gst='git status'
alias gss='git status --short'
alias gstash='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }


 # ----------------------
 # sfcc-ci alias / functions
 # ----------------------
alias sfc='cd ~/Volumes/Tools/sfcc-ci'

function sfcauth () { sfc && sfcc-ci auth:login; }

function sfchelp () { sfc && sfcc-ci --help; }

function sfclist () { sfc && sfcc-ci sandbox:list }

function sfccreate () { sfc & sfcc-ci sandbox:create -r abcn -j -t 0; }

function sfcget () { sfc && sfcc-ci sandbox:get --sandbox "$1"; }

function sfcrestart () { sfc && sfcc-ci sandbox:restart --sandbox "$1"; }

function sfcstart () { sfc && sfcc-ci sandbox:start --sandbox "$1"; }

function sfcstop () { sfc && sfcci-ci sandbox:stop --sandbox "$1"; }

function sfchardreset () { sfc && sfcc-ci sandbox:reset --sandbox "$1"; }

function sfccodev () { sfc && sfcc-ci code:list --instance "$1"; }
