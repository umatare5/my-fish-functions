function wstat --wraps='nload devices en0 -t 1000 -u m -U G' --description 'alias wstat=nload devices en0 -t 1000 -u m -U G'
  nload devices en0 -t 1000 -u m -U G $argv;
end
