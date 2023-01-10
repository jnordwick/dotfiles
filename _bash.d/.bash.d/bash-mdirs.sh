# bash

function dirs_mtf {
    if [[ $(dirs -p | wc -l) -lt 2 ]]; then
        echo 'no dir stack yet'
    else
        local d="$(dirs $1)"
        popd -n "$1"
        eval pushd "$d"
    fi
}

function dirs_mtf_1 { dirs_mtf +1 ; }
function dirs_mtf_2 { dirs_mtf +2 ; }
function dirs_mtf_3 { dirs_mtf +3 ; }


bind -x '"\C-g\C-g": dirs_mtf_1'
bind -x '"\C-g\C-f": dirs_mtf_2'
bind -x '"\C-g\C-d": dirs_mtf_3'


