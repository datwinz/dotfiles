# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export XDG_CONFIG_HOME=/home/void/.config
export EDITOR=/usr/bin/vim
