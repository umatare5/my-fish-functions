function gl --wraps='git log --graph --format --date --decorate-refs' --description 'alias gl=git log --graph --format --date --decorate-refs'
    git log --graph --pretty='format:%C(yellow)%h %C(white)%s %C(red)%d%C(green)<%an> %C(blue)[%ad]' --date=relative --decorate-refs=tags $argv
end
