function gdl --wraps='git diff --name-only' --description 'alias gdl=git diff --name-only'
    git diff --name-only $argv
end
