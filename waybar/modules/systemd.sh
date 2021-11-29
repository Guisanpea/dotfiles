#!/bin/bash

if ! systemctl is-system-running &>/dev/null
then
    echo $(systemctl is-system-running) $(systemctl list-units --failed --plain --no-legend --full | wc -l)
    exit 0
else
    exit 1
fi 

