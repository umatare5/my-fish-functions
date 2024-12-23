function gci --wraps='git commit -m' --description 'alias gci=git commit -m'
    git commit --signoff -m $argv
end
