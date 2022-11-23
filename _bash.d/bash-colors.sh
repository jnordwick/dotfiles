#
# Bash simple suppoprt for color.
#

set -x

declare -A fg_colors bg_colors
function make_color {
    fg_colors[$1]=$2
    fg_colors[b$1]=$(( $2 + 60 ))
    bg_colors[$1]=$(( $2 + 10 ))
    bg_coolor[b$1]=$(( $2 + 70 ))
}
make_color blk 30
make_color red 31
make_color grn 32
make_color ylw 33
make_color blu 34
make_color mag 35
make_color cyn 36
make_color wht 37

#function fgtru {
#    retval='\[\e[38;2;$1;$2;$3m\]'
#}

#function bgtru {
#    retval='\[\e[48;2;$1;$2;$3m\]'
#}

#rscr='\[\e[0m\]'
#bold='\[\e[1m\]';   rbold='\[\e[22m\]'
#faint='\[\e[2m\]';  rfaint='\[\e[22m\]'
#italic='\[\e[3m\]'; ritalic='\[\e[23m\]'
#uline='\[\e[4m\]';  ruline='\[\e[24m\]'
#blink='\[\e[5m\]';  rblink='\[\e[25m\]'
#inv='\[\e[7m\]';    rihnc='\[\e[27m\]'
#hid='\[\e[8m\]';    rhid='\[\e[28m\]'
#strike='\[\e[9m\]'; rstrike='\[\e[29m\]'

declare -a c_cur_bg=(40)
declare -a c_cur_fg=(37)

function stack_push {
    local -n stack=$1
    if [[ $# -eq 1 ]]; then
        stack+=("$stack[-1]")
    else
        shift
        stack+=("$@")
    fi
}

function stack_peek {
    local -n stack=$1
    echo "${stack[-1]}"
}

function stack_pop {
    local -n stack=$1
    echo "${stack[-1]}"
    unset "stack[-1]"
}

function c_apply_colors {
    printf '\e[%i;%im' "${c_cur_fg[-1]}" "${c_cur_bg[-1]}"
}

function c_set_colors {
    stack_push c_cur_fg ${fg_colors[$1]}
    stack_push c_cur_bg ${bg_colors[$2]}
    c_apply_colors
}

function c_unset_colors {
    stack_pop c_cur_fg
    stack_pop c_cur_bg
    c_apply_colors
}

