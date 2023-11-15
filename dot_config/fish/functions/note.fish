function note -d "take note on a scratch pad"
    cd ~/Documents/notes || exit
    nvim (gdate +%Y-%m-%d).md
end
