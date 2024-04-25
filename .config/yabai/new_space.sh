#!/usr/bin/env bash

PATH="/opt/homebrew/bin"

yabai -m space --create mouse
last_space=$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')
yabai -m space --focus "$last_space"
