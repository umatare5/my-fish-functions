function gp --wraps='git push origin HEAD' --description 'alias gp=git push origin HEAD'
    git push origin HEAD $argv
end
