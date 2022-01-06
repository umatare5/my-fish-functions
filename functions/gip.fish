function gip --wraps='curl https://ifconfig.io/host' --description 'alias gip=curl https://ifconfig.io/host'
  curl https://ifconfig.io/ip $argv;
end
