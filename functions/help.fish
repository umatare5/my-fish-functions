function help --wraps="--help" --description 'alias h=--help | bat --style=plain --color=always --paging=never'
  $argv --help | bat --style=plain --color=always --paging=never;
end
