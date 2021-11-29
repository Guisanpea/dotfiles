#!/usr/bin/env sh

# Terminate already running bar instances
pkill waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch main
# https://github.com/Alexays/Waybar/issues/515
GTK_THEME=Adapta waybar
