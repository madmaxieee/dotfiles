function pbcopy --wraps='tee /dev/tty | /usr/bin/pbcopy' --description 'alias pbcopy tee /dev/tty | /usr/bin/pbcopy'
  tee /dev/tty | /usr/bin/pbcopy $argv
        
end
