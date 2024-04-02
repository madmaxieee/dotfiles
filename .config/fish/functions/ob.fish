function ob --description 'open obsidian vault with nvim'
    cd ~/obsidian
    set -f vault $argv[1]
    if [ -z $vault ]
        set -f vault notes
    end
    cd "./$vault" || return 1
    nvim
end
