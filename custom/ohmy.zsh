alias vohmy='vim ~/.oh-my-zsh/custom/ohmy.zsh'

# find where an alias is defined - for functions use whence 'whence -v whencealias'
function whencealias(){
  if ! [ -z $1 ]; then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep $1
 fi
}




