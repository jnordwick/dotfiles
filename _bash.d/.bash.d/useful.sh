# bash

function find_in_parents {
    local fonly="$1"
    local starting="${2-$(pwd)}"
    local found=''
    pushd .
    cd "${starting}"
    while true; do
        echo looking for "${PWD}/${fonly}"
        if [[ -e "${PWD}/${fonly}" ]]; then
            printf -v found '%q\n' "${PWD}/${fonly}"
            break
        fi
        if [[ "${PWD}" = / ]]; then
            break
        fi
        cd ..
    done
    popd
    echo "$found"
    test -n "$found"
}

