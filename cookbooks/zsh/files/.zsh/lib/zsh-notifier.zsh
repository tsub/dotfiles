# 一定時間以上かかる処理の場合は終了時に通知してくれる
local COMMAND=""
local COMMAND_TIME=""
precmd() {
    if [ "$COMMAND_TIME" -ne "0" ] ; then
        local d=`date +%s`
        d=`expr $d - $COMMAND_TIME`
        if [ "$d" -ge "30" ] ; then
            COMMAND="$COMMAND "
            which terminal-notifier > /dev/null 2>&1 && terminal-notifier -activate com.googlecode.iterm2 -message "${${(s: :)COMMAND}[1]} ${${(s: :)COMMAND}[2]}" -m "$COMMAND";
        fi
    fi
    COMMAND="0"
    COMMAND_TIME="0"
}
preexec () {
    COMMAND="${1}"
    if [ "`perl -e 'print($ARGV[0]=~/ssh|^vi/)' $COMMAND`" -ne 1 ] ; then
        COMMAND_TIME=`date +%s`
    fi
}
