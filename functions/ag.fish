function ag --wraps='rg --pretty' --description 'alias ag=rg --pretty'
    rg --pretty --sort-files $argv
end
