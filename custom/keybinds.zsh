######################
# re-Key Bindings
######################i


##########
# zsh-autocomplete
##########

# rebinds the tab key back to menu cycling
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
