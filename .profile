[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.anaconda3/bin" ] && PATH="$HOME/.anaconda3/bin:$PATH"
[ -d "$HOME/.go/bin" ] && PATH="$HOME/.go/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.local/share/fnm" ] && PATH="$HOME/.local/share/fnm:$PATH" && eval "$(fnm env)"
[ -d "$HOME/.pixi/bin" ] && PATH="$HOME/.pixi/bin:$PATH"

# set editor
export EDITOR="nvim"
