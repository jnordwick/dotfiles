#
# A FILO stack in Bash - uses array to hodl stck
#

// declare -a s=(1 2 3)
// stack_push s 5 6 7
//   => s=1 2 3 5 6 7
// stack_push s # no item copies last
//   => s=1 2 3 5 6 7 7
// stack_peek s
//   => echos 7
//  stack_pop s var
//   => s=1 2 3 5 6 7
//   => var=7
// stack_pop s
//   => s=1 2 3 5 6
//   => echos 7

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
    local item="${stack[-1]}"
    if [[ -n "${2:-}" ]]; then
        local -n var=$2
        var="$item"
    echo
        echo "${item}"
    fi
}

function stack_pop {
    stack_peek "$@"
    local -n stack=$1
    unset "stack[-1]"
}

