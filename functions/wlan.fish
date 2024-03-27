function wlan --wraps='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I' --description 'alias wlan=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I'
    /usr/sbin/system_profiler SPAirPortDataType -json | jq '.SPAirPortDataType[0].spairport_airport_interfaces[0].spairport_current_network_information' | jq '[. |
        {
          "name": ._name,
          "security": (.spairport_security_mode | sub("s?pairport_security_mode_"; "")),
          "countryCode": .spairport_network_country_code,
          "channel": (.spairport_network_channel | split(" ")[0] | tonumber),
          "channelBand": (.spairport_network_channel | split(" ")[1] | sub("[(]"; "") | sub("GHz"; " GHz") | sub("[,]"; "")),
          "channelWidth": (.spairport_network_channel | split(" ")[2] | sub("[)]"; "") | sub("MHz"; " MHz")),
          "signal": (.spairport_signal_noise | split(" / ")[0] | sub (" dBm"; "") + " dBm"),
          "noise": (.spairport_signal_noise | split(" dBm / ")[1] | sub (" dBm"; "") + " dBm"),
          "phyMode": .spairport_network_phymode,
          "dataRate": (.spairport_network_rate | tostring + " Mbps"),
          "mcsIndex": .spairport_network_mcs,
        }]'
end
