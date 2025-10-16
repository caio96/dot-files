SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  in_docker      # Docker section
  conda          # conda virtualenv section
  exec_time      # Execution time
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0

# ------------------------------------------------------------------------------
# Custom In_Docker Section
# ------------------------------------------------------------------------------

SPACESHIP_IN_DOCKER_SHOW="${SPACESHIP_IN_DOCKER_SHOW=true}"
# SPACESHIP_IN_DOCKER_ASYNC="${SPACESHIP_IN_DOCKER_ASYNC=false}"
SPACESHIP_IN_DOCKER_PREFIX="${SPACESHIP_IN_DOCKER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_IN_DOCKER_SUFFIX="${SPACESHIP_IN_DOCKER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
# SPACESHIP_IN_DOCKER_SYMBOL="${SPACESHIP_IN_DOCKER_SYMBOL=""}"
SPACESHIP_IN_DOCKER_COLOR="${SPACESHIP_IN_DOCKER_COLOR="cyan"}"

spaceship_in_docker() {
  # If SPACESHIP_IN_DOCKER_SHOW is false, don't show in_docker section
  [[ $SPACESHIP_IN_DOCKER_SHOW == false ]] && return

  [[ -f /.dockerenv ]] || return

  # Display in_docker section
  spaceship::section \
    --color "$SPACESHIP_IN_DOCKER_COLOR" \
    --prefix "$SPACESHIP_IN_DOCKER_PREFIX" \
    --suffix "$SPACESHIP_IN_DOCKER_SUFFIX" \
    "🐳"
}
