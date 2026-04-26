# Uncomment to profile zsh startup
# PROFILE_ZSH="TRUE"
if [[ $PROFILE_ZSH == "TRUE" ]]; then zmodload zsh/zprof; fi

# -- History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE \
       HIST_FIND_NO_DUPS INC_APPEND_HISTORY EXTENDED_HISTORY

# -- Sane defaults
setopt AUTO_CD                  # `dir` -> `cd dir`
setopt INTERACTIVE_COMMENTS     # allow `#` comments in interactive shell
setopt NO_BEEP
setopt EXTENDED_GLOB            # **, ~, ^, qualifiers, etc.
setopt AUTO_PUSHD               # `cd` builds a stack; `cd -` cycles, `dirs -v` lists
setopt PUSHD_IGNORE_DUPS PUSHD_SILENT

# Drop `/` from word chars so Ctrl-W and Ctrl-Left stop at path separators
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# -- Key bindings (omz defaults)
bindkey -e                                       # emacs mode
bindkey '^[[H'    beginning-of-line              # Home
bindkey '^[[F'    end-of-line                    # End
bindkey '^[[3~'   delete-char                    # Delete
bindkey '^[[1;5C' forward-word                   # Ctrl-Right
bindkey '^[[1;5D' backward-word                  # Ctrl-Left

# Ctrl-X Ctrl-E -> edit current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# -- Plugins via antidote (self-installing)
# antidote auto-clones any plugin in ~/.zsh_plugins.txt that isn't yet cloned.
ANTIDOTE_DIR="$HOME/.antidote"
[ -d "$ANTIDOTE_DIR" ] || \
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"

# Set plugin-specific options BEFORE loading
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=none'

source "$ANTIDOTE_DIR/antidote.zsh"
antidote load   # reads ~/.zsh_plugins.txt, clones missing plugins, sources them

# -- Completion (after antidote so fpath is fully populated)
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump"
mkdir -p "${ZSH_COMPDUMP%/*}"
autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"

# -- Sources
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.aliases ] && source ~/.aliases

# -- Tool init
command -v zoxide  >/dev/null && eval "$(zoxide init zsh)"
# fzf 0.48+ ships its own integration (Ctrl-T file picker, Alt-C cd into dir;
# Ctrl-R is taken by atuin so fzf's history binding is silently overridden)
command -v fzf     >/dev/null && eval "$(fzf --zsh)" 2>/dev/null
command -v atuin   >/dev/null && eval "$(atuin init zsh)"

# -- Prompt (uses default starship.toml -> ➜; bash uses starship-bash.toml -> ❯)
command -v starship >/dev/null && eval "$(starship init zsh)"

# Leave at the end of .zshrc
if [[ $PROFILE_ZSH == "TRUE" ]]; then zprof; fi
