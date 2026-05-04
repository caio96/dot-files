#!/bin/bash

set -euo pipefail
set -x

# Install pixi and pixi packages
export PIXI_NO_PATH_UPDATE="True"
if ! command -v pixi >/dev/null && [ ! -x "$HOME/.pixi/bin/pixi" ]; then
  curl -fsSL https://pixi.sh/install.sh | sh
fi
# Make pixi bin visible
[ -d "$HOME/.pixi/bin" ] && PATH="$HOME/.pixi/bin:$PATH"

pixi global install atool \
  atuin \
  bat \
  btop \
  docker-buildx \
  dust \
  eza \
  fd-find \
  fzf \
  gh \
  git \
  gitui \
  git-delta \
  go \
  lua=5.1 \
  luarocks \
  nodejs \
  nvim \
  ripgrep \
  starship \
  tree-sitter-cli \
  uv

# Set up a "base" Python env with uv (replaces miniconda base)
# Treat ~/.venv as conda's base: pip-install into it freely, point nvim/linters at it.
# Required changes in dotfiles to auto-activate this on every shell:
#   .profile  ->  add:  [ -f "$HOME/.venv/bin/activate" ] && . "$HOME/.venv/bin/activate"
#   nvim      ->  set g:python3_host_prog = '~/.venv/bin/python'
uv python install 3.12
uv venv "$HOME/.venv" --python=3.12 --allow-existing
source "$HOME/.venv/bin/activate"
uv pip install ipython \
  pygments \
  pynvim

# Set up cargo
[ -d "$HOME/.cargo" ] || curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

# Setup dotfiles =============================================== #

# Helpers (idempotent):
#   backup_if_real <file>  -> mv <file> <file>.bak only if <file> is a real file
#                             we haven't already backed up (skips symlinks)
#   link <src> <dest>      -> create/refresh symlink, ensuring parent dir exists
backup_if_real() {
  local f=$1
  if [ -e "$f" ] && [ ! -L "$f" ]; then
    mv "$f" "${f}.bak.$(date +%Y%m%d-%H%M%S)"
  fi
}
link() {
  local src=$1 dest=$2
  mkdir -p "$(dirname "$dest")"
  ln -sfn "$src" "$dest"
}

# Download my dot files
DOT_FILES="$HOME/git/dot-files"
mkdir -p "$HOME/git"
[ -d "$DOT_FILES" ] || git clone https://github.com/caio96/dot-files.git "$DOT_FILES"

backup_if_real "$HOME/.bashrc"
backup_if_real "$HOME/.profile"
backup_if_real "$HOME/.zshrc"

if [[ -d "$DOT_FILES" && -n "$DOT_FILES" ]]; then
  link "$DOT_FILES/.aliases" "$HOME/.aliases"
  link "$DOT_FILES/.bashrc" "$HOME/.bashrc"
  link "$DOT_FILES/.gitconfig" "$HOME/.gitconfig"
  link "$DOT_FILES/.profile" "$HOME/.profile"
  link "$DOT_FILES/.tmux.conf" "$HOME/.tmux.conf"
  link "$DOT_FILES/.vimrc" "$HOME/.vimrc"
  link "$DOT_FILES/.wezterm.lua" "$HOME/.wezterm.lua"
  link "$DOT_FILES/.zshrc" "$HOME/.zshrc"
  link "$DOT_FILES/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

  link "$DOT_FILES/.config/nvim" "$HOME/.config/nvim"
  link "$DOT_FILES/.config/starship.toml" "$HOME/.config/starship.toml"
  link "$DOT_FILES/.config/atuin/config.toml" "$HOME/.config/atuin/config.toml"
  link "$DOT_FILES/.config/bat/config" "$HOME/.config/bat/config"
fi
