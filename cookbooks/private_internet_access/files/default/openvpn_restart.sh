#!/bin/bash

/etc/init.d/openvpn stop
sleep 5
kill "$(pgrep openvpn)"
sleep 2

if ! (pgrep openvpn | grep -q openvpn); then
  kill -9 "$(pgrep openvpn)"
fi

ifconfig tun0 down
/etc/init.d/openvpn start

TRY=0
while [ $TRY -lt 5 ]
do
  sleep 1
  if [ "$(rc-status | grep openvpn | grep -c started)" -eq 1 ]; then
    echo "openvpn_restart: success"
    echo
    ifconfig tun0
    exit 0
  fi
  TRY=$((TRY + 1))
done

echo "openvpn_restart: failed"
exit 1
