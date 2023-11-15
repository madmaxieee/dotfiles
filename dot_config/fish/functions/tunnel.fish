function tunnel -d "create a tunnel to a remote host"
    if test -z $argv[1]
        echo "usage: tunnel <port> [remote]"
        return 1
    end

    if test -z $argv[2]
        set argv[2] 140.112.252.119
    end

    bore local $argv[1] --to $argv[2] | sed -e 's/listening at\ /listening at\ http:\/\//'

end
