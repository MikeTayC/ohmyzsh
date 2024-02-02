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

