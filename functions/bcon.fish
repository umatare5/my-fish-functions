function bcon --wraps='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s' --description 'alias bcon=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s'
    /usr/sbin/system_profiler SPAirPortDataType -json | jq '.SPAirPortDataType[0].spairport_airport_interfaces[0].spairport_airport_other_local_wireless_networks' | jq '[.[] |
        {
          "name": ._name,
          "security": (.spairport_security_mode | sub("s?pairport_security_mode_"; "")),
          "channel": (.spairport_network_channel | split(" ")[0] + " ch"),
          "channelBand": (.spairport_network_channel | split(" ")[1] | sub("[(]"; "") | sub("GHz"; " GHz") | sub("[,]"; "")),
          "channelWidth": (.spairport_network_channel | split(" ")[2] | sub("[)]"; "") | sub("MHz"; " MHz")),
          "signal": (.spairport_signal_noise | split(" / ")[0] | sub (" dBm"; "") + " dBm"),
          "noise": (.spairport_signal_noise | split(" dBm / ")[1] | sub (" dBm"; "") + " dBm"),
        }] | sort_by(.name)'
end
