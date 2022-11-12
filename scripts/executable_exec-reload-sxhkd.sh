#!/usr/bin/env sh
set -evx
pkill -usr1 -x sxhkd || systemctl --user start sxhkd
notify-send 'sxhkd' 'Reloaded config'
