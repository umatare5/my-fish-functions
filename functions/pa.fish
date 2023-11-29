function pa --wraps='rg ~/.credentials/secrets.txt && rg ~/.envrc' --description 'alias pa=rg ~/.credentials/secrets.txt && rg ~/.envrc'
    if ! test (count $argv) -eq 1
        echo "Abort: Please set a argument"
        return
    end
    if test -f ~/.credentials/secrets.txt
        rg $argv ~/.credentials/secrets.txt
    end
    if test -f ~/.envrc
        rg $argv ~/.envrc
    end
end
