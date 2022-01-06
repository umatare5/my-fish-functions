function gci --wraps='git commit -m' --description 'alias gci=git commit -m'
  git commit -m $argv; 
end
