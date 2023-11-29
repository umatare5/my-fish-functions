function do --wraps='docker run --entrypoint "" --rm' --description 'alias do=docker run --entrypoint "" --rm'
    docker run --rm --entrypoint '' $argv
end
