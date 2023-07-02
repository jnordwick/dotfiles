# bash


# TODO change prompt to note saved

#
# kill current line and restore on enter
#
function saveline_restore {
    bind '"\C-m": "\C-g2\C-g3\C-y\C-e"'
}

function saveline_delete {
    bind '"\C-m": accept-line'
}

bind -x '"\C-g3": saveline_delete'
bind -x '"\C-g1": saveline_restore'
bind '"\C-g2": accept-line'
bind '"\C-x": "\C-a\C-k\C-g1"'



