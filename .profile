[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.pixi/bin" ] && PATH="$HOME/.pixi/bin:$PATH"
[ -f "$HOME/.venv/bin/activate" ] && source "$HOME/.venv/bin/activate"
[ -f "$HOME/.llm/env.sh" ] && source "$HOME/.llm/env.sh"

# set editor
export EDITOR="nvim"

# set locale
export LANG=C.UTF-8

