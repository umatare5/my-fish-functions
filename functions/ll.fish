function ll --wraps=ls --wraps='exa -l -g --icons' --description 'alias ll=exa -l -g --icons'
  exa -l -g --icons $argv; 
end
