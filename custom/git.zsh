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

# alias gcm='git commit -m'
alias gcf='git config --list'
alias mast='git checkout master'
alias dev='git checkout develop'
alias gco='git checkout'
alias gcb='git checkout -b'
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
alias ghist='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gh='git log -n 1 --pretty=format:"<< %Cred%H%Creset >>%C(auto)%d%Creset %n- %C(blue)%s (%C(dim green)%ar)"'
alias ghd='git log -n 1 --pretty=format:"%H" develop'
alias gl='git log -n 5 --pretty=format:" %C(dim blue)<<%Creset %C(bold yellow)%H%Creset %C(dim blue)>>%n%C(auto)%d%Creset %n%n    %C(dim blue)-%Creset %C(magenta)%s %n    %C(dim blue)-%Creset %C(bold blue)%an<%Cred%ae> (%C(dim green)%ar) %n%n %C(dim yellow)------------------------------------------------------------------------------------------ %n"'
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

function gcm() { 
  branch=$(git rev-parse --abbrev-ref HEAD)
  jira=$(printf $branch | sed -ne 's/.*\/\(LCR2-\([0-9]*\)\).*/\1/p')

  if [[ -n "${jira/[ ]*\n/}" ]]; then
    git commit -m "$jira - $1"
  else
    # Checks if hotfix/release branch, to prefix it; otherwise no ticket
    release=$(printf $branch | sed -ne 's/.*\/\(release-[0-9].[0-9].[0-9]\).*/\1/p')
    if [[ -n "${release/[ ]*\n/}" ]]; then
      git commit -m "$(print -r -- "${release//release-/Release }") - $1"
    else
      git commit -m "NO TICKET - $1"
    fi
  fi
}

function gcna() { git commit -m "NO TICKET - $1" }
function gcu() { git checkout "unstable/release-$1" }
function gch() { git checkout "hotfix/release-$1" }
function gmu() { git merge "unstable/release-$1" }
function gmh() { git merge "hotfix/release-$1" }
function gcbu() { git checkout -b "unstable/release-$1" }
function gcbh(){ git checkout -b "hotfix/release-$1" }

# update the unstable and hotfix branches with any remote origin changes
function gsr() {
  ## detach head for saftey --quiet to reduce commands
  git checkout --quiet --detach HEAD
  
  # git fetch origin master:master develop:develop
  for arg
  do
    if [[ -n $(git ls-remote --heads origin refs/heads/unstable/release-"$arg") ]]; then
      printf '\033[32;1m%s\033[0m\n' "unstable/release-$arg exists - fetching"
      git fetch origin unstable/release-"$arg":unstable/release-"$arg"
    elif [[ -n $(git ls-remote --heads origin refs/heads/hotfix/release-"$arg") ]]; then
       printf '\033[34;1m%s\033[0m\n' "hotfix/release-$arg exists - fetching"
       git fetch origin hotfix/release-"$arg":hotfix/release-"$arg"
    else
      printf '\033[0;30m%s\033[0m\n' "There are no unstable/hotfix with version: $arg"
    fi

  done
  # Reattach head
  git checkout --quiet -
}

# update unstabe/hotfix and merge latest from develop 
function gsr-develop() {
   local dev="develop"
   

   printf '\033[32;1m%s\033[0m\n' "Pulling $dev from origin.." 
   git checkout $dev
   git fetch
   git pull origin $dev

   for arg
   do
     if [[ -n $(git ls-remote --heads origin refs/heads/unstable/release-"$arg") ]]; then
       
       printf '\033[34;1m%s\033[0m\n' "Merging (--ff-only) $dev into unstable/release-$arg.."
       git fetch . "$dev":unstable/release-"$arg"
   
       printf '\033[34;1m%s\033[0m\n' "Pushing unstable/release-$arg to origin.."
       git push origin unstable/release-"$arg"
     elif [[ -n $(git ls-remote --heads origin refs/heads/hotfix/release-"$arg") ]]; then
      
      printf '\033[33;1m%s\033[0m\n' "Merging (--ff-only) $dev into hotfix/release-$arg.."
      git fetch . "$dev":hotfix/release-"$arg"

      printf '\033[35;1m%s\033[0m\n' "Pushing hotfix/release-$arg to origin.."
      git push origin hotfix/release-"$arg"
    else
      printf '\033[0;30m%s\033[0m\n' "There are no unstable/hotfix with version: $arg"
    fi

  done
  # Reattach head
  git checkout --quiet -
}

# set master to develops current HEAD
function git-remaster() {
  local dev="develop"
  local m="master"

  git checkout $dev

  printf '\033[32;1m%s\033[0m\n' "Pulling $dev from origin.."
  git fetch
  git pull origin $dev

  printf '\033[31;1m%s\033[0m\n' "Latest commit on $dev:"
  git log -n 1 --pretty=format:"%Cred%H%Creset - %C(yellow)%s" $dev

  git checkout $m

  printf '\033[34;1m%s\033[0m\n' "Hard reset to latest commit.."
  git reset --hard $(git log -n 1 --format="%H" $dev)

  # gl - custom git log alias 
  gl -3

  if read -q "choice?Press Y/y to push this to $m: "; then
    printf '\033[35;1m%s\033[0m\n' "\nEntered: $choice .."
    git push
  else
    printf  '\033[0;30m%s\033[0m\n' "\nEntered: $choice .. so push it yourself"
    
    # git log alias
    gl
  fi
}
