#
# ~/.bashrc
#

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GOPATH=~/go
export PATH="~/bin:~/.local/bin:~/.config/emacs/bin:$PATH"

[[ $- != *i* ]] && return
# interactive only after here

function shload {
    local s="$(realpath -m ~/.bash.d/$1)"
    local b="$(basename -s .SH -- ${s^^})"
    local -n v="SHLOAD_${b//[^a-zA-Z0-9]/_}"
    if [[ -e "$s" ]]; then
        source "$s" "${@:2}"
        v="$?"
    else
        echo "shload: $s not found at line $(caller)" >&2
        v=-1
    fi
}

alias ls='ls --color=auto'
alias l='ls -v'
alias ll='ls -lv'
alias la='ls -av'   # show long listing of all except ".."
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#shload bash-saveline.sh

set -o ignoreeof
shopt -s checkwinsize expand_aliases

export PAGER=less
export LESS='-RFXi'

HISTSIZE=50000
SAVEHIST=50000
HISTIGNORE=exit:bg:fg:history:pwd:jobs
HISTCONTROL=ignoreboth
shopt -s histappend

alias _lsb='ls --group-directories-first --color=always -s=Name -Fhv'
alias l=lsb
alias ll='_lsb -l'
alias la='_lsb -a'
alias lla='ll -a'

export EDITOR=vim
export VISUAL=vim
alias vi=vim
alias v=vim

alias eec="vim ~/.doom.d/config.el"
alias vvc='vim ~/.bashrc'

alias pp=pushd
alias px=popd

stty -ixon

eval "$(starship init bash)"

# Automatically added by the Guix install script.
if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)"\\$" ]]; then
        PS1="${BASH_REMATCH[1]} [env]\\\$ "
    fi
fi


