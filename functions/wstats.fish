function wstats --wraps='nload devices en0 -t 1000 -u m -U G' --description 'alias wstats=nload devices en0 -t 1000 -u m -U G'
  nload devices en0 -t 1000 -u m -U G $argv;
end
