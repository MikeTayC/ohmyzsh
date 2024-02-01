###############
# oh my zsh - customizations 
###############

#######
# aliases for oh my zsh customizations
######
alias vzsh='vim ~/.zshrc'
alias ohmy='cd ~/.oh-my-zsh/custom/'
alias vohmy='vim ~/.oh-my-zsh/custom/ohmy.zsh'
alias cohmy='cat ~/.oh-my-zsh/custom/ohmy.zsh'

#######
# methods for searching for aliases/commands
#######

# find where an alias is defined - for functions use whence 'whence -v whencealias'
function whencealias(){
  if ! [ -z $1 ]; then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep -w $1
 fi
}

# grep search aliases based on their commands


# alias to sort the folder/files in the current directory by date
alias las='la -tU'


