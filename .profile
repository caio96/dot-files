[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.pixi/bin" ] && PATH="$HOME/.pixi/bin:$PATH"
[ -f "$HOME/.venv/bin/activate" ] && source "$HOME/.venv/bin/activate"
[ -f "$HOME/.llm/env.sh" ] && source "$HOME/.llm/env.sh"

# set editor
export EDITOR="nvim"

# set locale
export LANG=C.UTF-8

# Auto-launch ssh-agent and load every private key in ~/.ssh/ (idempotent).
# Skipped inside SSH sessions ($SSH_CONNECTION is set by sshd) 
if [ -z "$SSH_CONNECTION" ]; then
    agent_env=~/.ssh/agent.env

    agent_load_env() { [ -f "$agent_env" ] && . "$agent_env" >/dev/null; }
    agent_start() {
        (
            umask 077
            ssh-agent >"$agent_env"
        )
        . "$agent_env" >/dev/null
    }
    agent_add_keys() {
        for key in "$HOME"/.ssh/id_*; do
            case "$key" in
            *.pub) ;;
            *) [ -f "$key" ] && ssh-add "$key" >/dev/null 2>&1 ;;
            esac
        done
    }

    agent_load_env

    # 0 = agent running with key; 1 = agent running, no key; 2 = agent not running
    ssh-add -l >/dev/null 2>&1
    agent_run_state=$?

    if [ -z "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
        agent_start
        agent_add_keys
    elif [ "$agent_run_state" = 1 ]; then
        agent_add_keys
    fi

    unset agent_env agent_run_state
fi
