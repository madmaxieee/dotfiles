function zq -d "use zoxide query with other commands"
    if [ (count $argv) -eq 0 ]
        return
    else if contains . $argv
        echo '.'
    else
        zoxide query --exclude (pwd) $argv
    end
end
