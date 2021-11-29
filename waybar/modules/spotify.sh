#!/bin/bash

info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
if [[ "${#info}" > 40 ]]; then
    info=$(echo $info | cut -c1-40)"..."
fi

echo "$info"
