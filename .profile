[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -d "$HOME/.go/bin" ] && PATH="$HOME/.go/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

[ -s "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"

[ -d "/usr/local/cuda/bin" ] && PATH="/usr/local/cuda/bin:$PATH"
[ -d "/usr/local/cuda-12.5/lib64" ] && LD_LIBRARY_PATH="/usr/local/cuda-12.5/lib64:$LD_LIBRARY_PATH"

# set editor
export EDITOR="nvim"
