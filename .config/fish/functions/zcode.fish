function zcode -d "use zoxide query with the code command"
    # don't do anything if no argument is given
    if test -z $argv[1]
        echo "usage: zcode <query>"
        return 1
    end
    set -l path (zoxide query $argv[1]) || return 1
    cd $path
    code .
end
