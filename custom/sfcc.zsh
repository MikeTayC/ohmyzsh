# -------------------------
# sfcc-ci alias / functions
# -------------------------
alias csfc="cat $ZSH_CUSTOM/sfcc.zsh"
alias vsfc="vim $ZSH_CUSTOM/sfcc.zsh"
alias sfc="cd ~/Volumes/Tools/sfcc-ci"
alias sfci="sfcc-ci"
alias sfcc="sfcc-ci"
function sfcauth () { sfc && sfcc-ci auth:login; }

function sfchelp () { sfc && sfcc-ci --help; }

function sfclist () { sfc && sfcc-ci sandbox:list }

function sfccreate () { sfc & sfcc-ci sandbox:create -r "$1" -t 0; }

function sfcget () { sfc && sfcc-ci sandbox:get --sandbox "$1"; }

function sfcrestart () { sfc && sfcc-ci sandbox:restart --sandbox "$1"; }

function sfcstart () { sfc && sfcc-ci sandbox:start --sandbox "$1"; }

function sfcstop () { sfc && sfcc-ci sandbox:stop --sandbox "$1"; }

function sfcdelete () { sfc && sfcc-ci sandbox:delete --sandbox "$1"; }

function sfchardreset () { sfc && sfcc-ci sandbox:reset --sandbox "$1"; }

function sfccodev () { sfc && sfcc-ci code:list --instance "$1"; }


