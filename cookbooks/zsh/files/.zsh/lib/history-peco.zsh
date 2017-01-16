# history filter
# http://qiita.com/uchiko/items/f6b1528d7362c9310da0
function history-peco() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N history-peco
bindkey '^r' history-peco
