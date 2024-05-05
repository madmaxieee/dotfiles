#!/opt/homebrew/bin/fish
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title zopen
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "query" }

# Documentation:
# @raycast.description open any directory with zoxide
# @raycast.author 莊加旭
# @raycast.authorURL https://github.com/madmaxieee

zopen "$argv"
