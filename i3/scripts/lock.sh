#!/usr/bin/env bash

icon="$HOME/.config/i3/scripts/lock.png"
tmpbg='/tmp/screen_locked.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -b -u -i "$tmpbg"
