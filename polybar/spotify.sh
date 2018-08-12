#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi  
  artist=$(playerctl metadata artist)
  title=$(playerctl metadata title)
  status=$(playerctl status)
  # icon=""
  if [ "$status" = Playing ]; then
    icon=
  else
    icon=
  fi
  echo $icon '' $title - $artist

}

main "$@"