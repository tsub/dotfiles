# Helper function to check if no subcommand has been given yet
function __fish_cmux_no_subcommand
    set -l cmds version ping capabilities identify \
        list-windows current-window new-window focus-window close-window \
        move-workspace-to-window reorder-workspace workspace-action \
        list-workspaces new-workspace new-split \
        list-panes list-pane-surfaces focus-pane new-pane new-surface close-surface \
        move-surface reorder-surface tab-action rename-tab drag-surface-to-split \
        refresh-surfaces surface-health trigger-flash \
        list-panels focus-panel close-workspace select-workspace \
        rename-workspace rename-window current-workspace \
        read-screen send send-key send-panel send-key-panel \
        notify list-notifications clear-notifications \
        claude-hook \
        set-status clear-status list-status \
        set-progress clear-progress \
        log clear-log list-log sidebar-state \
        set-app-focus simulate-app-active \
        capture-pane resize-pane pipe-pane wait-for swap-pane break-pane join-pane \
        next-window previous-window last-window last-pane find-window \
        clear-history set-hook popup bind-key unbind-key copy-mode \
        set-buffer list-buffers paste-buffer respawn-pane display-message \
        browser help
    for token in (commandline -opc)
        if contains -- $token $cmds
            return 1
        end
    end
    return 0
end

# Helper function to check if a specific subcommand is active
function __fish_cmux_using_subcommand
    set -l cmd $argv[1]
    set -l tokens (commandline -opc)
    for i in (seq 2 (count $tokens))
        if test $tokens[$i] = $cmd
            return 0
        end
    end
    return 1
end

# Helper function to check if browser subcommand and no browser sub-subcommand yet
function __fish_cmux_browser_no_subcommand
    if not __fish_cmux_using_subcommand browser
        return 1
    end
    set -l browser_cmds open open-split goto navigate back forward reload \
        url get-url snapshot eval wait click dblclick hover focus check uncheck \
        scroll-into-view type fill press keydown keyup select scroll \
        get is find frame dialog download cookies storage tab console errors \
        highlight state addinitscript addscript addstyle viewport geolocation geo \
        offline trace network screencast input identify
    for token in (commandline -opc)
        if contains -- $token $browser_cmds
            return 1
        end
    end
    return 0
end

# Global options
complete -c cmux -l socket   -d 'Unix socket path' -r
complete -c cmux -l window   -d 'Target window' -r
complete -c cmux -l password -d 'Socket password' -r
complete -c cmux -l json     -d 'Output as JSON'
complete -c cmux -l id-format -d 'ID format' -r -a 'refs uuids both'
complete -c cmux -l version  -d 'Show version'

# Main subcommands
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a version           -d 'Show version'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a ping              -d 'Ping the socket'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a capabilities      -d 'List server capabilities'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a identify          -d 'Identify current workspace/surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-windows      -d 'List windows'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a current-window    -d 'Show current window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a new-window        -d 'Create a new window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a focus-window      -d 'Focus a window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a close-window      -d 'Close a window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a move-workspace-to-window -d 'Move workspace to another window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a reorder-workspace -d 'Reorder workspace position'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a workspace-action  -d 'Perform workspace action'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-workspaces   -d 'List workspaces'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a new-workspace     -d 'Create a new workspace'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a new-split         -d 'Create a new split'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-panes        -d 'List panes'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-pane-surfaces -d 'List pane surfaces'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a focus-pane        -d 'Focus a pane'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a new-pane          -d 'Create a new pane'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a new-surface       -d 'Create a new surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a close-surface     -d 'Close a surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a move-surface      -d 'Move a surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a reorder-surface   -d 'Reorder surface position'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a tab-action        -d 'Perform tab action'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a rename-tab        -d 'Rename a tab'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a drag-surface-to-split -d 'Drag surface to split'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a refresh-surfaces  -d 'Refresh all surfaces'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a surface-health    -d 'Check surface health'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a trigger-flash     -d 'Trigger flash on surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-panels       -d 'List panels'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a focus-panel       -d 'Focus a panel'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a close-workspace   -d 'Close a workspace'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a select-workspace  -d 'Select a workspace'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a rename-workspace  -d 'Rename a workspace'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a rename-window     -d 'Rename a window'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a current-workspace -d 'Show current workspace'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a read-screen       -d 'Read screen content'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a send              -d 'Send text to surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a send-key          -d 'Send key to surface'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a send-panel        -d 'Send text to panel'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a send-key-panel    -d 'Send key to panel'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a notify            -d 'Send notification'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-notifications -d 'List notifications'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a clear-notifications -d 'Clear notifications'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a claude-hook       -d 'Trigger Claude hook'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a set-status        -d 'Set sidebar status'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a clear-status      -d 'Clear sidebar status'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-status       -d 'List sidebar status'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a set-progress      -d 'Set progress indicator'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a clear-progress    -d 'Clear progress indicator'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a log               -d 'Log a message'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a clear-log         -d 'Clear log'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-log          -d 'List log entries'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a sidebar-state     -d 'Get sidebar state'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a set-app-focus     -d 'Set app focus state'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a simulate-app-active -d 'Simulate app active'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a capture-pane      -d 'Capture pane content (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a resize-pane       -d 'Resize a pane (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a pipe-pane         -d 'Pipe pane output (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a wait-for          -d 'Wait for signal (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a swap-pane         -d 'Swap panes (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a break-pane        -d 'Break pane (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a join-pane         -d 'Join pane (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a next-window       -d 'Next window (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a previous-window   -d 'Previous window (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a last-window       -d 'Last window (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a last-pane         -d 'Last pane (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a find-window       -d 'Find window (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a clear-history     -d 'Clear history (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a set-hook          -d 'Set hook (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a popup             -d 'Show popup (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a bind-key          -d 'Bind key (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a unbind-key        -d 'Unbind key (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a copy-mode         -d 'Copy mode (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a set-buffer        -d 'Set buffer (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a list-buffers      -d 'List buffers (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a paste-buffer      -d 'Paste buffer (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a respawn-pane      -d 'Respawn pane (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a display-message   -d 'Display message (tmux compat)'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a browser           -d 'Browser automation'
complete -c cmux -n '__fish_cmux_no_subcommand' -f -a help              -d 'Show help'

# Common options used by many commands
complete -c cmux -n 'not __fish_cmux_no_subcommand' -l workspace -d 'Target workspace (id|ref|index)' -r
complete -c cmux -n 'not __fish_cmux_no_subcommand' -l surface   -d 'Target surface (id|ref|index)' -r
complete -c cmux -n 'not __fish_cmux_no_subcommand' -l pane      -d 'Target pane (id|ref|index)' -r
complete -c cmux -n 'not __fish_cmux_no_subcommand' -l panel     -d 'Target panel (id|ref)' -r

# identify
complete -c cmux -n '__fish_cmux_using_subcommand identify' -l no-caller -d 'Exclude caller info'

# new-workspace
complete -c cmux -n '__fish_cmux_using_subcommand new-workspace' -l command -d 'Command to run' -r

# new-split
complete -c cmux -n '__fish_cmux_using_subcommand new-split' -f -a 'left right up down' -d 'Split direction'

# new-pane / new-surface
for subcmd in new-pane new-surface
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l type      -d 'Pane type' -r -a 'terminal browser'
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l direction -d 'Direction' -r -a 'left right up down'
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l url       -d 'URL for browser pane' -r
end

# focus-window / close-window / move-workspace-to-window
for subcmd in focus-window close-window
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l window -d 'Target window ID' -r
end

# move-workspace-to-window
complete -c cmux -n '__fish_cmux_using_subcommand move-workspace-to-window' -l window -d 'Target window' -r

# reorder-workspace / reorder-surface / move-surface
for subcmd in reorder-workspace reorder-surface move-surface
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l index  -d 'Target index' -r
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l before -d 'Insert before id|ref|index' -r
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l after  -d 'Insert after id|ref|index' -r
end

# move-surface
complete -c cmux -n '__fish_cmux_using_subcommand move-surface' -l window -d 'Target window' -r
complete -c cmux -n '__fish_cmux_using_subcommand move-surface' -l focus  -d 'Focus after move' -r -a 'true false'

# workspace-action / tab-action
for subcmd in workspace-action tab-action
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l action -d 'Action name' -r
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l title  -d 'Title text' -r
end

# tab-action extras
complete -c cmux -n '__fish_cmux_using_subcommand tab-action' -l tab -d 'Target tab' -r
complete -c cmux -n '__fish_cmux_using_subcommand tab-action' -l url -d 'URL' -r

# drag-surface-to-split
complete -c cmux -n '__fish_cmux_using_subcommand drag-surface-to-split' -f -a 'left right up down' -d 'Direction'

# read-screen / capture-pane
for subcmd in read-screen capture-pane
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l scrollback -d 'Include scrollback buffer'
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l lines      -d 'Number of lines' -r
end

# notify
complete -c cmux -n '__fish_cmux_using_subcommand notify' -l title    -d 'Notification title' -r
complete -c cmux -n '__fish_cmux_using_subcommand notify' -l subtitle -d 'Notification subtitle' -r
complete -c cmux -n '__fish_cmux_using_subcommand notify' -l body     -d 'Notification body' -r

# claude-hook
complete -c cmux -n '__fish_cmux_using_subcommand claude-hook' -f -a 'session-start stop notification' -d 'Hook event'

# set-status
complete -c cmux -n '__fish_cmux_using_subcommand set-status' -l icon  -d 'Icon name' -r
complete -c cmux -n '__fish_cmux_using_subcommand set-status' -l color -d 'Color (#hex)' -r

# set-progress
complete -c cmux -n '__fish_cmux_using_subcommand set-progress' -l label -d 'Progress label' -r

# log
complete -c cmux -n '__fish_cmux_using_subcommand log' -l level  -d 'Log level' -r
complete -c cmux -n '__fish_cmux_using_subcommand log' -l source -d 'Log source name' -r

# list-log
complete -c cmux -n '__fish_cmux_using_subcommand list-log' -l limit -d 'Limit number of entries' -r

# set-app-focus
complete -c cmux -n '__fish_cmux_using_subcommand set-app-focus' -f -a 'active inactive clear' -d 'Focus state'

# resize-pane
complete -c cmux -n '__fish_cmux_using_subcommand resize-pane' -s L -d 'Resize left'
complete -c cmux -n '__fish_cmux_using_subcommand resize-pane' -s R -d 'Resize right'
complete -c cmux -n '__fish_cmux_using_subcommand resize-pane' -s U -d 'Resize up'
complete -c cmux -n '__fish_cmux_using_subcommand resize-pane' -s D -d 'Resize down'
complete -c cmux -n '__fish_cmux_using_subcommand resize-pane' -l amount -d 'Resize amount' -r

# pipe-pane
complete -c cmux -n '__fish_cmux_using_subcommand pipe-pane' -l command -d 'Shell command to pipe to' -r

# wait-for
complete -c cmux -n '__fish_cmux_using_subcommand wait-for' -s S -l signal  -d 'Signal name'
complete -c cmux -n '__fish_cmux_using_subcommand wait-for' -l timeout -d 'Timeout in seconds' -r

# swap-pane
complete -c cmux -n '__fish_cmux_using_subcommand swap-pane' -l target-pane -d 'Target pane' -r

# break-pane / join-pane
for subcmd in break-pane join-pane
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l no-focus -d 'Do not focus after action'
end

# join-pane
complete -c cmux -n '__fish_cmux_using_subcommand join-pane' -l target-pane -d 'Target pane' -r

# find-window
complete -c cmux -n '__fish_cmux_using_subcommand find-window' -l content -d 'Search in content'
complete -c cmux -n '__fish_cmux_using_subcommand find-window' -l select  -d 'Select matching window'

# set-hook
complete -c cmux -n '__fish_cmux_using_subcommand set-hook' -l list  -d 'List hooks'
complete -c cmux -n '__fish_cmux_using_subcommand set-hook' -l unset -d 'Unset hook for event' -r

# set-buffer / paste-buffer
for subcmd in set-buffer paste-buffer
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l name -d 'Buffer name' -r
end

# respawn-pane
complete -c cmux -n '__fish_cmux_using_subcommand respawn-pane' -l command -d 'Command to run' -r

# display-message
complete -c cmux -n '__fish_cmux_using_subcommand display-message' -s p -l print -d 'Print to stdout'

# browser subcommands
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a open           -d 'Open browser split'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a open-split     -d 'Open browser in split'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a goto           -d 'Navigate to URL'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a navigate       -d 'Navigate to URL'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a back           -d 'Go back'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a forward        -d 'Go forward'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a reload         -d 'Reload page'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a url            -d 'Get current URL'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a get-url        -d 'Get current URL'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a snapshot       -d 'Take snapshot'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a eval           -d 'Evaluate JavaScript'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a wait           -d 'Wait for condition'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a click          -d 'Click element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a dblclick       -d 'Double click element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a hover          -d 'Hover over element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a focus          -d 'Focus element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a check          -d 'Check checkbox'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a uncheck        -d 'Uncheck checkbox'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a scroll-into-view -d 'Scroll element into view'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a type           -d 'Type text into element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a fill           -d 'Fill input element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a press          -d 'Press key'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a keydown        -d 'Key down'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a keyup          -d 'Key up'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a select         -d 'Select option'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a scroll         -d 'Scroll page'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a get            -d 'Get page data'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a is             -d 'Check element state'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a find           -d 'Find element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a frame          -d 'Switch frame'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a dialog         -d 'Handle dialog'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a download       -d 'Handle download'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a cookies        -d 'Manage cookies'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a storage        -d 'Manage storage'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a tab            -d 'Manage tabs'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a console        -d 'Manage console'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a errors         -d 'Manage errors'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a highlight      -d 'Highlight element'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a state          -d 'Save/load browser state'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a addinitscript  -d 'Add init script'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a addscript      -d 'Add script'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a addstyle       -d 'Add CSS style'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a viewport       -d 'Set viewport size'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a geolocation    -d 'Set geolocation'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a geo            -d 'Set geolocation'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a offline        -d 'Set offline mode'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a trace          -d 'Manage tracing'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a network        -d 'Manage network'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a screencast     -d 'Manage screencast'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a input          -d 'Input control'
complete -c cmux -n '__fish_cmux_browser_no_subcommand' -f -a identify       -d 'Identify browser surface'

# browser common option: --snapshot-after
for subcmd in goto navigate back forward reload click dblclick hover focus check uncheck scroll-into-view type fill press keydown keyup select scroll
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -l snapshot-after -d 'Take snapshot after action'
end

# browser snapshot options
complete -c cmux -n '__fish_cmux_using_subcommand snapshot' -s i -l interactive -d 'Interactive mode'
complete -c cmux -n '__fish_cmux_using_subcommand snapshot' -l cursor           -d 'Include cursor'
complete -c cmux -n '__fish_cmux_using_subcommand snapshot' -l compact          -d 'Compact output'
complete -c cmux -n '__fish_cmux_using_subcommand snapshot' -l max-depth        -d 'Max depth' -r
complete -c cmux -n '__fish_cmux_using_subcommand snapshot' -l selector         -d 'CSS selector' -r

# browser wait options
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l selector     -d 'CSS selector' -r
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l text         -d 'Text to wait for' -r
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l url-contains -d 'URL substring to wait for' -r
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l load-state   -d 'Load state to wait for' -r -a 'interactive complete'
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l function     -d 'JavaScript function' -r
complete -c cmux -n '__fish_cmux_using_subcommand wait' -l timeout-ms   -d 'Timeout in milliseconds' -r

# browser scroll options
complete -c cmux -n '__fish_cmux_using_subcommand scroll' -l selector -d 'CSS selector' -r
complete -c cmux -n '__fish_cmux_using_subcommand scroll' -l dx       -d 'Horizontal scroll amount' -r
complete -c cmux -n '__fish_cmux_using_subcommand scroll' -l dy       -d 'Vertical scroll amount' -r

# browser get subcommands
complete -c cmux -n '__fish_cmux_using_subcommand get' -f -a 'url title text html value attr count box styles'

# browser is subcommands
complete -c cmux -n '__fish_cmux_using_subcommand is' -f -a 'visible enabled checked'

# browser find subcommands
complete -c cmux -n '__fish_cmux_using_subcommand find' -f -a 'role text label placeholder alt title testid first last nth'

# browser dialog
complete -c cmux -n '__fish_cmux_using_subcommand dialog' -f -a 'accept dismiss'

# browser download
complete -c cmux -n '__fish_cmux_using_subcommand download' -f -a wait
complete -c cmux -n '__fish_cmux_using_subcommand download' -l path       -d 'Download path' -r
complete -c cmux -n '__fish_cmux_using_subcommand download' -l timeout-ms -d 'Timeout in milliseconds' -r

# browser cookies / storage
for subcmd in cookies
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -f -a 'get set clear'
end
complete -c cmux -n '__fish_cmux_using_subcommand storage' -f -a 'local session'

# browser tab
complete -c cmux -n '__fish_cmux_using_subcommand tab' -f -a 'new list switch close'

# browser console / errors
for subcmd in console errors
    complete -c cmux -n "__fish_cmux_using_subcommand $subcmd" -f -a 'list clear'
end

# browser state
complete -c cmux -n '__fish_cmux_using_subcommand state' -f -a 'save load'

# browser trace
complete -c cmux -n '__fish_cmux_using_subcommand trace' -f -a 'start stop'

# browser network
complete -c cmux -n '__fish_cmux_using_subcommand network' -f -a 'route unroute requests'

# browser screencast / input
complete -c cmux -n '__fish_cmux_using_subcommand screencast' -f -a 'start stop'
complete -c cmux -n '__fish_cmux_using_subcommand input' -f -a 'mouse keyboard touch'

# browser offline
complete -c cmux -n '__fish_cmux_using_subcommand offline' -f -a 'true false'
