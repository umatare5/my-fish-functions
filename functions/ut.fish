function ut -a unixtime --description 'alias ut=date -u -d @<unixtime> +"%Y-%m-%dT%H:%M:%SZ"'
  date -u -d @$unixtime +"%Y-%m-%dT%H:%M:%SZ"
end
