SHELL=$(command -v zsh)
export SHELL

[[ -z "$ZSH_VERSION" && -n "$SHELL" ]] && exec "$SHELL" -l
