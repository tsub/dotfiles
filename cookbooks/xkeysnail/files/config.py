# -*- coding: utf-8 -*-

import os
import re
from datetime import datetime
from xkeysnail.transform import *

# see https://github.com/mooz/xkeysnail/blob/148e1e1e354334d391d40923812ebe85d8a5a876/xkeysnail/transform.py#L94
def launch_with_pipe(command):
    def launcher_with_pipe():
        from subprocess import Popen, PIPE
        Popen(command, shell = True, stdout = PIPE)
    return launcher_with_pipe

# [Global modmap] Change modifier keys as in xmodmap
define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.LEFT_CTRL: Key.CAPSLOCK,
    Key.LEFT_ALT: Key.LEFT_META,
    Key.RIGHT_ALT: Key.RIGHT_META,
    Key.LEFT_META: Key.LEFT_ALT,
    Key.KEY_FN_F1: Key.MUTE,
    Key.KEY_FN_F2: Key.VOLUMEDOWN,
    Key.KEY_FN_F3: Key.VOLUMEUP,
})

# [Global keymap] Change keybindings
timestamp = datetime.now().strftime("%Y-%m-%d-%H%M%S%3s")
define_keymap(lambda wm_class: wm_class, {
    K("Shift-Super-KEY_4"): launch(["maim", "-s", "%s/screenshot-%s.png" % (os.environ["HOME"], timestamp)]),
    K("C-Super-Shift-KEY_4"): launch_with_pipe("maim -s | xclip -selection clipboard -t image/png"),
    K("Super-Space"): launch(["rofi", "-show"]),
    K("Shift-Super-v"): launch(["rofi", "-show", "clipboard", "-modi", "clipboard:greenclip print", "-run-command", "{cmd}"]),
})

# [Global keymap] Change keybindings except Alacritty
define_keymap(lambda wm_class: wm_class not in ("Alacritty", "Rofi"), {
    K("Super-w"): K("C-w"),
    K("Super-a"): K("C-a"),
    K("Super-r"): K("C-r"),
    K("Super-z"): K("C-z"),
    K("Super-x"): K("C-x"),
    K("Super-c"): K("C-c"),
    K("Super-v"): K("C-v"),
    K("Super-f"): K("C-f"),
    K("Super-minus"): K("C-minus"),
    K("Super-equal"): K("C-equal"),
    K("Super-KEY_0"): K("C-KEY_0"),
})

# Keybindings for Chrome
define_keymap(re.compile("Google-chrome"), {
    K("Shift-Super-x"): K("C-Shift-x"), # for 1Password X
    K("Super-t"): K("C-t"),
    K("Super-n"): K("C-n"),
    K("Super-Shift-n"): K("C-Shift-n"),
    K("Super-Shift-t"): K("C-Shift-t"),
    K("Super-Shift-LEFT_BRACE"): K("C-Shift-TAB"),
    K("Super-Shift-RIGHT_BRACE"): K("C-TAB"),
}, "Chrome")

# Keybindings for Slack
define_keymap(re.compile("Slack"), {
    K("Super-k"): K("C-k"),
    K("Super-KEY_1"): K("C-KEY_1"),
    K("Super-KEY_2"): K("C-KEY_2"),
    K("Super-KEY_3"): K("C-KEY_3"),
    K("Super-KEY_4"): K("C-KEY_4"),
    K("Super-KEY_5"): K("C-KEY_5"),
    K("Super-KEY_6"): K("C-KEY_6"),
    K("Super-KEY_7"): K("C-KEY_7"),
    K("Super-KEY_8"): K("C-KEY_8"),
    K("Super-KEY_9"): K("C-KEY_9"),
}, "Slack")
