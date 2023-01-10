# bash

# ordered set implemented with a hash and vector

function oset_make {
    eval "declare -ga ${1}_v__=()"
    eval "declare -gA ${1}_h__=()"
    eval "declare -gi ${1}_m__=${2}"
}

function get_index {
    local -n v="$1"
    for x in "${!v[@]}"; do
        if [[ v["$x"] = "$2" ]]; then
            echo "$x"
            break
        fi
    done
    echo ''
}

function oset_add {
    local -n v="${1}_v__"
    local -n h="${1}_h__"
    local -n m="${1}_m__"

    if [[ ! -v h["$2"] ]]; then
        local -i cnt="${#v}"
        v+=("$2")
        h["$2"]=''
        if [[ $cnt -gt $m ]]; then
            v="${v[@]:1}"
        fi
    else
        local -i i=$(get_index "${1}_v__" "$2")
        local -n v=()$"{1}_v__"
        v=("${v[@]:i:1}" "$v[$i]" "$v[@]:0:(($i-1)):1")
    fi
    
}

