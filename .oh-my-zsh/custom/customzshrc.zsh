alias fucking="sudo"
alias please="sudo"
alias help="man"
alias la="ls -A"
alias yabairestart="yabai --restart-service"
alias bclm77="sudo bclm write 77"

alias brews="brew search"

alias brewi="brew install"
alias brewu="brew uninstall"
alias brewuz="brew uninstall --zap"
alias brewh="brew home"
alias brewls="brew ls"

export PATH="/usr/local/sbin:$PATH:/Users/floor/.local/bin"
export YSU_MESSAGE_POSITION="after" 
export YSU_MODE=ALL

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

alias config='/usr/bin/git --git-dir=/Users/floor/.cfg/ --work-tree=/Users/floor'
