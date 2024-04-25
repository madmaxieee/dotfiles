#!/usr/bin/env bash

PATH="/opt/homebrew/bin"

direction=$1

# if direction is not valid, exit
if [[ ! "$direction" =~ ^(north|east|south|west)$ ]]; then
    exit 1
fi

# yabai -m window --swap "$direction"  || yabai -m window --display "$direction"
yabai -m window --swap "$direction" && exit
yabai -m window --display "$direction"
yabai -m display --focus "$direction"
