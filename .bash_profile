# PATH first (pixi, venv), so zsh/starship from ~/.pixi/bin are found
[ -f ~/.profile ] && . ~/.profile

SHELL=$(command -v zsh)
export SHELL

[[ -z "$ZSH_VERSION" && -n "$SHELL" ]] && exec "$SHELL" -l

# No zsh available: fall back to the normal bash setup
[ -f ~/.bashrc ] && . ~/.bashrc
