function cat --wraps='bat --style plain --paging never' --description 'alias cat=bat --style plain --paging never'
    bat --style plain --paging never --theme "Monokai Extended Bright" $argv
end
