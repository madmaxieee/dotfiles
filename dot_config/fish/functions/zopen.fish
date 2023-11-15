function zopen -d "use z with open command"
    # don't do anything if no argument is given
    if test -z $argv[1]
        echo "usage: zopen <query>"
        return 1
    end
    set -l path (zoxide query $argv[1]) || return 1
    cd $path
    open .
end
