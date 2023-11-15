function dequarantine --wraps='xattr -d com.apple.quarantine' --description 'alias dequarantine xattr -d com.apple.quarantine'
  xattr -d com.apple.quarantine $argv; 
end
