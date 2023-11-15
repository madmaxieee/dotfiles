function tree --wraps='exa -T -a -I .git' --description 'alias tree exa -T -a -I .git'
  exa -T -a -I .git $argv; 
end
