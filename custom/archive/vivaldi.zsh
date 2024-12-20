alias vivcrash='find ~/Library/Application\ Support/Vivaldi/Crashpad/pending -newer /Applications/Vivaldi.app -name \*.dmp | zip -j ~/Downloads/Vivaldi\ Crash\ Logs\ $(date '+%Y%m%d-%H%M') -@'
