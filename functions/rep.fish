function rep --wraps='rg --pretty' --description 'alias rep=rg --pretty'
  rg --pretty $argv; 
end
