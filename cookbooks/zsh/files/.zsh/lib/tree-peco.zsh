function tree-peco () {
  local SELECTED_FILE=$(tree --charset=o -f | peco | tr -d '\||`|-' | xargs echo)
  BUFFER="$EDITOR $SELECTED_FILE"
  zle accept-line
}

zle -N tree-peco
bindkey "^t" tree-peco