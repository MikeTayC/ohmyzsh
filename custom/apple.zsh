###########
# MacOS related CUSTOM commands and functions
###########

#####
# aliases
#####

# Display graphics settings
alias sys='system_profiler SPDisplaysDataType'

#####
# functions
#####

# remove current desktop image
function rmd () {
  osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)';
}

