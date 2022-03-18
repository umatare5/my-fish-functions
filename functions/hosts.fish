function hosts --wraps=hosts --wraps='grep -v -e "localhost\|broadcasthost\|^\s*#\|^\s*$" /etc/hosts' --description 'alias hosts=grep -v -e "localhost\|broadcasthost\|^\s*#\|^\s*$" /etc/hosts'
  grep -v -e 'localhost\|broadcasthost\|^\s*#\|^\s*$' /etc/hosts;
end
