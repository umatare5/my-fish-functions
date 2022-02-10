function pa --wraps='rg ~/.credentials/secrets.txt' --description 'alias pa=rg ~/.credentials/secrets.txt'
  if test (count $argv) -eq 1
    rg $argv ~/.credentials/secrets.txt;
  else
    echo "Abort: Please set a argument"
  end
end
