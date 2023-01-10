#
# Bash simple suppoprt for color.
#

shload bash-stack.sh

declare -gA c_fg_colors c_bg_colors

function make_color {
    function _sb {
        local -n t=$1
        t[$2]=$3
        t[$3]=$3
    }
    _sb c_fg_colors $1 $2
    _sb c_bg_colors $1 $(( $2 + 10 ))
    _sb c_fg_colors b$1 $(( $2 + 60 ))
    _sb c_bg_colors b$1 $(( $2 + 70 ))
}
make_color blk 30
make_color red 31
make_color grn 32
make_color ylw 33
make_color blu 34
make_color mag 35
make_color cyn 36
make_color wht 37
unset make_color

function c_resolve {
    local fgi="${1:-.}"
    local bgi="${2:-.}"
    if [[ $fgi =~ [.] ]]; then fgi=wht; fi
    if [[ $bgi =~ [.] ]]; then bgi=blk; fi
    echo "${c_fg_colors[$fgi]};${c_bg_colors[$bgi]}"
}

#rscr='\[\e[0m\]'
#bold='\[\e[1m\]';   rbold='\[\e[22m\]'
#faint='\[\e[2m\]';  rfaint='\[\e[22m\]'
#italic='\[\e[3m\]'; ritalic='\[\e[23m\]'
#uline='\[\e[4m\]';  ruline='\[\e[24m\]'
#blink='\[\e[5m\]';  rblink='\[\e[25m\]'
#inv='\[\e[7m\]';    rihnc='\[\e[27m\]'
#hid='\[\e[8m\]';    rhid='\[\e[28m\]'
#strike='\[\e[9m\]'; rstrike='\[\e[29m\]'

declare -ag c_hist_colors=("$(c_resolve wht blk)")

function c_apply_top_colors {
    if [[ "$#" -eq 0 ]]; then
        printf '\e[%sm' "${c_hist_colors[-1]}"
    else
        printf -v "$1" '\e[%sm' "${c_hist_colors[-1]}"
    fi
}

function c_push_colors {
    local c=$(c_resolve "$1" "$2")
    stack_push c_hist_colors "$c"
    c_apply_top_colors
}

function c_pop_colors {
    stack_pop c_hist_colors
    c_apply_top_colors
}

function c_wrap_colors {
    local c=$(c_resolve "$1" "$2")
    c_push_colors "$c"
    echo "${@:3}"
    c_pop_colors
}

