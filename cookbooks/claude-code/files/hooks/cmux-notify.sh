#!/bin/bash
# Skip if not in cmux
[ -S /tmp/cmux.sock ] || exit 0

EVENT=$(cat)
EVENT_TYPE=$(echo "$EVENT" | jq -r '.hook_event_name // "unknown"')
TOOL=$(echo "$EVENT" | jq -r '.tool_name // ""')
MESSAGE=$(echo "$EVENT" | jq -r '.message // ""')

case "$EVENT_TYPE" in
    "Stop")
        cmux notify --title "Claude Code" --body "Session complete"
        ;;
    "PostToolUse")
        [ "$TOOL" = "Task" ] && cmux notify --title "Claude Code" --body "Agent finished"
        ;;
    "Notification")
        cmux notify --title "Claude Code" --body "$MESSAGE"
        ;;
esac
