# aliases for oh my zsh customizations
alias ohmy='cd ~/.oh-my-zsh/custom/'
alias vohmy='vim ~/.oh-my-zsh/custom/ohmy.zsh'
alias cohmy='cat ~/.oh-my-zsh/custom/ohmy.zsh'

# find where an alias is defined - for functions use whence 'whence -v whencealias'
function whencealias(){
  if ! [ -z $1 ]; then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep $1
 fi
}

# alias to sort the folder/files in the current directory by date
alias las='la -tU'


