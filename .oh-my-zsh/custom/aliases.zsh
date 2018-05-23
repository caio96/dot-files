# For a full list of active aliases, run `alias`.

# Unalias oh-my-zsh aliases
unalias 1
unalias 2
unalias 3
unalias 4
unalias 5
unalias 6
unalias 7
unalias 8
unalias 9
unalias _
unalias afind
unalias d
unalias grep
unalias history
unalias l
unalias la
unalias ll
unalias ls
unalias lsa
unalias md
unalias please
unalias po
unalias pu
unalias rd
unalias which-command

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.git,.hg}'
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'
alias lsize='du -had 1 | sort -hr'
alias diff='colordiff'
alias n='nautilus .'
alias tkillmux='tmux kill-session -t 0'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias pc-update="sudo apt update && sudo apt -y upgrade && sudo apt-get -y autoremove && sudo apt -y autoclean"
# Add an "alert" alias for long running commands.  Use like so: "sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias network-restart="service network-manager restart"
alias touchpad-restart="sudo modprobe -r psmouse && sudo modprobe psmouse"
