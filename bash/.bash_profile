# Acliased commands per comy #
alias ls='ls -FG'
alias ll='ls -FGlAhp'
alias less='less -FSRXc'
alias more='more -FSRXc'
alias desk='cd ~/Desktop/; clear; ll;'
alias ssh='ssh -v'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clean='rm -f *.*~ .*~ ' # because i hate ~ at the end of files
alias cleanDiskImage='sudo rm /private/var/vm/sleepimage' # os x
alias vim='vim -O'

set -o emacs

cd ~/Desktop/
ll
