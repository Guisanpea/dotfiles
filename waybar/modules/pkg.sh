#!/bin/bash

pacman_check() {
    pac=$(checkupdates 2>/dev/null)
    if test -n "$pac"; then pac_count=$(wc -l <<< "$pac"); else pac_count="0"; fi
    aur=$(trizen -Qua 2>/dev/null)
    if test -n "$aur"; then aur_count=$(wc -l <<< "$aur"); else aur_count="0"; fi
    
    if [[ "$pac_count" -eq 0 ]] && [[ "$aur_count" -eq 0 ]]; then exit; fi

    text="$pac_count <span foreground='#929292'></span> $aur_count"
    tooltip_pac="pacman: $(awk -v ORS=' ' '$0=$1' <<< "$pac")"
    tooltip_aur="aur: $(awk -v ORS=' ' '$0=$1' <<< "$aur")"
    tooltip+=$(if test -n "$pac"; then echo "$tooltip_pac"; fi)
    tooltip+=$(if test -n "$pac" && test -n "$aur"; then echo "\n\n"; fi)
    tooltip+=$(if test -n "$aur"; then echo "$tooltip_aur"; fi)
}

xbps_check(){
    xbps=$(xbps-install -Mnu 2>/dev/null)
    if test -n "$xbps"; then xbps_count=$(wc -l <<< "$xbps"); else xbps_count="0"; fi
    flatpak=$(flatpak remote-ls --updates --columns=app)
    if test -n "$flatpak"; then flatpak_count=$(wc -l <<< "$flatpak"); else flatpak_count="0"; fi

    if [[ "$xbps_count" -eq 0 ]] && [[ "$flatpak_count" -eq 0 ]]; then exit; fi

    text="$xbps_count <span foreground='#929292'></span> $flatpak_count"
    tooltip_xbps="xbps: $(awk -v ORS=' ' '$0=$1 {gsub(/-[^-]*$/,"",$0) ; print}' <<< "$xbps")"
    tooltip_flat="flatpak: $(awk -v ORS=' ' '$0=$1' <<< "$flatpak")"
    tooltip+=$(if test -n "$xbps"; then echo "$tooltip_xbps"; fi)
    tooltip+=$(if test -n "$xbps" && test -n "$flatpak"; then echo "\n\n"; fi)
    tooltip+=$(if test -n "$flatpak"; then echo "$tooltip_flat"; fi)
}

if grep -i "arch" /etc/os-release &>/dev/null
then
    pacman_check
elif grep -i "void" /etc/os-release &>/dev/null
then
    xbps_check
fi

# Print json
printf '{"text": "%s", "tooltip": "%s"}' "$text" "$tooltip"
