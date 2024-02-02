#################
# Customize the various oh-my-zsh history lib/plugin settings
#################

# increase SAVEHIST to 50000 - This controls the number of entries from HISTFILE into zsh shell memory
[ "$SAVEHIST" -lt 50000 ] && SAVEHIST=50000

# history range - usage: history -E -l $1 $2
alias hsr='history -E -l'

alias backup_history="cp $HOME/.zsh_history $HOME/.zsh_history_backups/zsh_history_$(date +\%Y_\%m_\%d).bak"

