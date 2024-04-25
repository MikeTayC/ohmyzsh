#
# Aliases
# (sorted alphabetically)
#

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gcm='git commit -m'
alias gcf='git config --list'
alias master='git checkout master'
alias develop='git checkout develop'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'

alias gf='git fetch'

alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glgd='git log --graph --oneline --decorate --all'
alias glpf='git log --pretty=format:"%h %ad %s" --date=short --all'
alias ghist='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gh='git log -n 1 --pretty=format:"%H"'
alias ghd='git log -n 1 --pretty=format:"%H" develop'

alias gd='git diff'
alias gda='git diff HEAD'
alias gdc='git diff --cached'

alias gm='git merge'
alias gmd='git merge develop'
alias gma='git merge --abort'

alias gp='git push'

alias gr='git restore'
alias gra='git restore .'
alias grm='git rm'
alias grmc='git rm --cached'

alias gsb='git status -sb'
alias gss='git status -s'
alias gst='git status'

alias gph='git pull origin $(git rev-parse --abbrev-ref HEAD) --ff-only'
alias gphff='git pull origin $(git rev-parse --abbrev-ref HEAD) --ff-only'
alias gphn='git pull origin $(git rev-parse --abbrev-ref HEAD) --no-ff'
alias gpl='git pull'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

function gclc() { 
  jira=$(git rev-parse --abbrev-ref HEAD | sed -ne 's/.*\/\(LCR2-\([0-9]*\)\).*/\1/p')

  if [[ -n "${jira/[ ]*\n/}" ]]; then
    git commit -m "$jira - $1"
  else
    git commit -m "NO TICKET - $1"
  fi
}

function gcna() { git commit -m "NO TICKET - $1" }
function gcu() { git checkout "unstable/release-$1" }
function gch() { git checkout "hotfix/release-$1" }
function gmu() { git merge "unstable/release-$1" }
function gmh() { git merge "hotfix/release-$1" }

function gsr() {
  ## detach head for saftey --quiet to reduce commands
  git checkout --quiet --detach HEAD
  
  # git fetch origin master:master develop:develop
  for arg
  do
    if [[ -n $(git ls-remote --heads origin refs/heads/unstable/release-"$arg") ]]; then
      printf '%s\n' "unstable/release-$arg exists - fetching"
      git fetch origin unstable/release-"$arg":unstable/release-"$arg"
    elif [[ -n $(git ls-remote --heads origin refs/heads/hotfix/release-"$arg") ]]; then
       printf '%s\n' "hotfix/release-$arg exists - fetching"
       git fetch origin unstable/release-"$arg":unstable/release-"$arg"
    else
      printf '%s\n' "There are no unstable/hotfix with version: $arg"
    fi

  done
  # Reattach head
  git checkout --quiet -
}
