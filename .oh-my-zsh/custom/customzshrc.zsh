# Aliases
alias fucking="sudo"
alias please="sudo"
alias help="man"
alias la="ls -A"

alias vim="nvim"

## Dotfile Bare Git Repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias configa="config add"
alias configcm="config commit -m"
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
export SSH_ENV="$HOME/.ssh/environment"

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

# Linux-specific
# Environment variables
export XDG_CONFIG_HOME=/home/void/.config
export EDITOR=/usr/bin/vim
export MOZ_ENABLE_WAYLAND=1
export LIBVA_DRIVER_NAME=i965
export PATH=$PATH:/opt/texlive/2023/bin/x86_64-linux:~/.local/bin
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info
