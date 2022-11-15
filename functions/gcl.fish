function gcl --wraps='git clone --filter=blob:none' --description 'alias gcl=git clone --filter=blob:none'
  git clone --filter=blob:none $argv;
end
