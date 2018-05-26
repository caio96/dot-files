# Made with Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 0)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

user=""
host=""
dir=""
git=""
char=""

#user="\[${MAGENTA}\]\u "

if [[ -n $SSH_CONNECTION ]]; then
    host="\[$ORANGE\]\h "
fi

dir="\[$GREEN\]\w "

git="\[$PURPLE\]\$(parse_git_branch) "
if [ $git == " " ]; then
    git=""
fi

#char="\[$WHITE\]\n\$ \[$RESET\]"
char="\[$WHITE\]\$ \[$RESET\]"

function prompt_command() {
  PS1="\n${BOLD}$user$host$dir$git$char"
}

safe_append_prompt_command prompt_command
