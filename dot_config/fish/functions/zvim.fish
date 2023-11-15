function zvim -d "use zoxide query with the nvim command"
    # don't do anything if no argument is given
    if test -z $argv[1]
        echo "usage: zvim <query>"
        return 1
    end
    set -l path (zoxide query $argv[1]) || return 1
    # prompt for comfirmation
    read --prompt "echo \"Go to $path? (y/n) \"" -l choice
    if test "$choice" != n -a "$choice" != N
        cd $path
        nvim
    end
end
