function wlog --wraps='sudo dmesg | grep en0 | grep change | grep -e=BSSID|channel' --description 'alias wlog=sudo dmesg | grep en0 | grep change | grep -e=BSSID|channel'
  sudo dmesg | grep en0 | grep change | grep -e "BSSID|channel" $argv;
end
