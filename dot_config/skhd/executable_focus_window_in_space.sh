#!/usr/bin/env bash
# focus a space while ignoring Arc PIP windows

space_index=$1

space_has_focus=$(yabai -m query --windows --space "$space_index" \
    | jq '[ .[] | select(.app=="Arc" and .["is-floating"] | not) ] | map(.["has-focus"]) | any')

if [[ "$space_has_focus" = "false" ]]; then
    first_window_id="null"
    first_window_id=$(yabai -m query --windows --space "$space_index" | jq '[ .[] | select(.app=="Arc" and .["is-floating"] | not) ].[0].id')
    yabai -m query --windows --space "$space_index" | jq '[ .[] | select(.app=="Arc" and .["is-floating"] | not) ].[0]'
    if [[ "$first_window_id" != "null" ]]; then
        yabai -m window --focus "$first_window_id"
    else
        exit 1
    fi
fi
