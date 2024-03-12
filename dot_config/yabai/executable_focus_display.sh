#!/usr/bin/env bash
# focusing display in direction while ignoring Arc PIP windows

direction=$1

visible_space_index=$(yabai -m query --spaces --display "$direction" | jq '.[] | select(.["is-visible"]==true) | .index')

~/.config/skhd/focus_window_in_space.sh "$visible_space_index" || yabai -m display --focus "$direction"
