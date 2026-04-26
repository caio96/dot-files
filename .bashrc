# bashrc file

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# QoL shopts
shopt -s globstar   # enable ** recursive glob
shopt -s autocd     # `dir` -> `cd dir`
shopt -s cdspell    # autocorrect minor cd typos
shopt -s dirspell   # autocorrect dir name during completion
shopt -s histverify # `!!` shows command before running

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Tool inits
command -v fzf >/dev/null && eval "$(fzf --bash)" 2>/dev/null

# Use bash-specific starship config (keeps ❯; zsh's default config uses ➜)
export STARSHIP_CONFIG="$HOME/.config/starship-bash.toml"
command -v starship >/dev/null && eval "$(starship init bash)"

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.profile ] && source ~/.profile
