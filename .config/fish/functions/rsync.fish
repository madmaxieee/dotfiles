function rsync --description 'alias rsync rsync --progress --archive' --wraps rsync
    command rsync --progress --archive $argv
end
