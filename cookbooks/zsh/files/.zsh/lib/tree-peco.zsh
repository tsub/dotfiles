function tree-peco () {
  local SELECTED_FILE=$(tree --charset=o -f | peco | tr -d '\||`|-' | xargs echo)
  if [ "$SELECTED_FILE" != "" ]; then
    BUFFER="$EDITOR $SELECTED_FILE"
    zle accept-line
  fi
}

zle -N tree-peco
bindkey "^t" tree-peco
