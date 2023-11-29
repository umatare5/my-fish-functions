function gpt --wraps='git push --tags origin' --description 'alias gpt=git push --tags origin'
    git push --tags origin $argv
end
