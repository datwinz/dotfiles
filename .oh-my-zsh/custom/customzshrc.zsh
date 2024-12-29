# Personal aliases
alias fucking="sudo"
alias please="sudo"
alias help="man"
alias la="ls -A"

alias vim="nvim"

## Dotfile Bare Git Repo
alias config="/usr/bin/git --git-dir=/Users/floor/.cfg/ --work-tree=/Users/floor"
alias configa="config add"
alias configcmsg="config commit -m"
alias configst="config status"
alias configlog="config log --oneline --decorate --graph"
alias configd="config diff"
alias configds="config diff --staged"
alias configrs="config restore"
alias configrst="config restore --staged"

unalias md
function md() {
    mkdir -p "${1}" && cd "${1}"
}

# Environment variables
export YSU_MESSAGE_POSITION="after" 
export YSU_MODE=ALL

# Autostart ssh-agent the Joseph M. Reagle way from https://web.archive.org/web/20210506080335/https://mah.everybody.org/docs/ssh#run-ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Mac-specific
# Aliases
alias yabairestart="yabai --restart-service"

# Package manager aliases
alias brews="brew search"
alias brewi="brew install"
alias brewu="brew uninstall"
alias brewuz="brew uninstall --zap --force"
alias brewh="brew home"
alias brewls="brew ls"

# Environment variables
export PATH="/usr/local/sbin:$PATH:/Users/floor/.local/bin"

empty_trash () {
  osascript 2> /dev/null <<EOF
  tell application "Finder"
    empty trash
  end tell
EOF
}
