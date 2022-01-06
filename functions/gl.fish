function gl --wraps='git log --oneline --graph --decorate' --description 'alias gl=git log --oneline --graph --decorate'
  git log --oneline --graph --decorate $argv; 
end
