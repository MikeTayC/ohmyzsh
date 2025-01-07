###########
# MacOS related CUSTOM commands and functions
###########

#####
# aliases
#####

# Display graphics settings
alias sys='system_profiler SPDisplaysDataType'
alias showdir='defaults write com.apple.Finder AppleShowAllFiles true'
alias hidedir='defaults write com.apple.Finder AppleShowAllFiles false'

#####
# functions
#####

# remove current desktop image
function rmd () {
  osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)';
}

function iterm-semantic-history () { 
    # Excluded values
    local excluded=(
    	.DS_Store
	.CFUserTextEncoding
	.zsh_history.backup
	.zsh_history
	img
	jpg
	dmg
	zip
	.localized
    )

    if (($excluded[(Ie)$1:t] || $excluded[(Ie)$1:t:e])); then
	return 1
    fi

    if [[ -d $1 ]]; then
        cd $1 && ll
    elif [[ -f $1 ]]; then
        vim $1
    else
        echo "$1 - value is probably not a directory or file"
    fi
}
