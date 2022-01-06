function alogin --wraps='aws sso login --profile' --description 'alias alogin=aws sso login --profile'
  aws sso login --profile $argv;
end
