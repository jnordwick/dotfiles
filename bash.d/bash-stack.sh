
#
# A stack in Bash - uses array to hodl stck
#

# declare -a s=(1 2 3)
# stack_push s 5 6 7
#   => s=1 2 3 5 6 7
# stack_push s # no item copies last
#   => s=1 2 3 5 6 7 7
# stack_peek s
#   => echos 7
#  stack_pop s var
#   => s=1 2 3 5 6 7
#   => var=7
# stack_pop s
#   => s=1 2 3 5 6
#   => echos 7

#stack_push stack (va1) ... (valN)
function stack_push {
    local -n stack="$1"
    if [[ "$#" -eq 1 ]]; then
        stack+=("$stack[-1]")
    else
        shift
        stack+=("$@")
    fi
}

# stack_peek stack var n
# stack (req): name of var of stack
# var (optional): var to write result of peekk
# n (optional): nunmber of elements (requires var)
function stack_peek_fixme {
    local -n stack="$1"
    local i="${3:-1}"
    local item="${stack[-${i}]}"
    if [[ -n "$2" ]]; then
        local -n var="$2"
        var="${item}"
    echo
        echo "${item}"
    fi
}

# stack_peep stack (var)
function stack_peek {
    local -n stack="$1"
    local item="${stack[-1]}"
    if [[ -n "$2" ]]; then
        local -n elm="$2"
        elm="${item}"
    else
        echo "${item}"
    fi
}

# FIXME: only works on last value
# stack_pop stack (var)
function stack_pop {
    stack_peek "$@"
    local -n stack="$1"
    unset stack[-1]
}

