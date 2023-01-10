
[[ $- != *i* ]] && return

export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

shload git-prompt.sh
shload bash-colors.sh

#
# exit status
#
p_exit_stat=''
function pr_exit_status {
    local last=$?
    local fgcolor=$(( $last == 0 ? 32 : 31 ))
    printf -v p_exit_stat "[\[\e[%im\]%3i\[\e[0m\]]" $fgcolor $last
}

function dirs_list {

        dirs -p | sed -n '2,$ s/^/ -> /' | tr -d '\n'
}

function full_prompt {
#    c_set_colors grn blk
#    dirs_list
#    c_unset_colors
#    pr_exit_status
    __git_ps1 "$p_exit_stat\w" "\\\$ "
}

PROMPT_COMMAND='full_prompt'


