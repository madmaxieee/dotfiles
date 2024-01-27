#!/usr/bin/env bash

direction=$1

# direction must be one of the following: north, east, south, west, prev, next
# if direction is not valid, exit
if [[ ! "$direction" =~ ^(north|east|south|west)$ ]]; then
    exit 1
fi

# yabai -m window --swap "$direction"  || yabai -m window --display "$direction"
yabai -m window --swap "$direction" && exit
yabai -m window --display "$direction"
yabai -m display --focus "$direction"
