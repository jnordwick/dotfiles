function prompt_dstack() {
  typeset -g POWERLEVEL9K_DSTACK_FOREGROUND=#ff851b
  typeset -g POWERLEVEL9K_DSTACK_BACKGROUND=#001f3f

  typeset -g POWERLEVEL9K_DSTACK_ICON=$'\U1f4da'
  typeset -g POWERLEVEL9K_DSTACK_SEP=$'\U2b9a'
  typeset -g POWERLEVEL9K_DSTACK_TOPN=5

  if [ $#dirstack -eq 0 ]; then
    return;
  fi

  local dirsep=$POWERLEVEL9K_DSTACK_SEP
  local ncomps=$POWERLEVEL9K_DSTACK_TOPN
  local lastn=$(( $#dirstack < $ncomps ? $#dirstack : $ncomps ))
  local str="($#dirstack)"
  local cursep=' '
  
  for n in {1..$lastn}; do
    str+="${cursep}${(D)dirstack[$n]}"
    cursep=" $dirsep "
  done

  p10k segment -b $POWERLEVEL9K_DSTACK_BACKGROUND -f $POWERLEVEL9K_DSTACK_FOREGROUND -i $POWERLEVEL9K_DSTACK_ICON -t "$str"
}

