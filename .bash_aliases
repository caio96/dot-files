# Alias definitions
alias cat='batcat'
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.git,.hg}'
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'
alias lsize='du -had 1 | sort -hr'
alias n='nohup nautilus . > /dev/null 2>&1 &'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ubuntu-update='sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove && sudo apt -y clean'
alias git-fetch-branches='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done; git fetch --all; git pull --all'

