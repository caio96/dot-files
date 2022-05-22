# Alias definitions
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.git,.hg}'
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'
alias lsize='du -had 1 | sort -hr'
alias diff='colordiff'
alias t='thunar .'
alias n='nohup nautilus . > /dev/null 2>&1 &'
alias tkillmux='tmux kill-session -t 0'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ubuntu-update='sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove && sudo apt -y clean'
alias net-restart-arch='service network-manager restart'
alias net-restart-ubuntu='systemctl restart NetworkManager'
alias touchpad-restart='sudo modprobe -r psmouse && sudo modprobe psmouse'
alias git-fetch-branches='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done; git fetch --all; git pull --all'
alias gst='git status'
alias cycle-display='disper --cycle-stages="-S : -s" --cycle'
alias toggle-redshift='pkill -USR1 redshift'

