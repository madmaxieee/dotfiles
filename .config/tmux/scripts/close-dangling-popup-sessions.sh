#! /usr/bin/env bash

tmux ls | ~/.config/tmux/scripts/close-dangling-popup-sessions.awk | xargs -I {} tmux kill-session -t {}
