# On slow systems, checking the cached .zcompdump file to see if it must be 
# regenerated adds a noticable delay to zsh startup.  This little hack restricts 
# it to once a day.  It should be pasted into your own completion file.
# https://gist.github.com/ctechols/ca1035271ad134841284
# https://github.com/ggteixeira/macOS-Dotfiles/blob/17681071cf0f9905ddcd1936efe025c83878307d/.zshrc#L138
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;


 # --------------------------------------------------------------------
 # Completion Styles - From long ago during initial Oh-my-zsh set up
 # --------------------------------------------------------------------

 # list of completers to use
 zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

 # allow one error for every three characters typed in approximate completer
 zstyle -e ':completion:*:approximate:*' max-errors \
     'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

 # insert all expansions for expand completer
 zstyle ':completion:*:expand:*' tag-order all-expansions

 # formatting and messages
 zstyle ':completion:*' verbose yes
 zstyle ':completion:*:descriptions' format '%B%d%b'
 zstyle ':completion:*:messages' format '%d'
 zstyle ':completion:*:warnings' format 'No matches for: %d'
 zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
 zstyle ':completion:*' group-name ''

 # match uppercase from lowercase
 zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

 # offer indexes before parameters in subscripts
 zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

 # command for process lists, the local web server details and host completion
 # on processes completion complete all user processes
 # zstyle ':completion:*:processes' command 'ps -au$USER'

 ## add colors to processes for kill completion
 zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

 #zstyle ':completion:*:processes' command 'ps ax -o pid,s,nice,stime,args | sed "/ps/d"'
 zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
 zstyle ':completion:*:processes-names' command 'ps axho command'
 #zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
 #
 #NEW completion:
 # Filename suffixes to ignore during completion (except after rm command)
 zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
     '*?.old' '*?.pro'
 # the same for old style completion
 #fignore=(.o .c~ .old .pro)i

 # Colors for files and directory
#zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
