#!/bin/bash

function openvpn_service_running() {
  rc-status | grep openvpn | grep started | wc -l
}

function openvpn_pid() {
  ps -ax | grep "/usr/sbin/openvpn --config" | grep -v grep | cut -b1-5
}

/etc/init.d/openvpn stop
sleep 5
kill `openvpn_pid`
sleep 2
openvpn_pid | grep -q openvpn
if [ $? -gt 0 ]; then
  kill -9 `openvpn_pid`
fi

ifconfig tun0 down
/etc/init.d/openvpn start

TRY=0
while [ $TRY -lt 5 ]
do
  sleep 1
  if [ `openvpn_service_running` -eq 1 ]; then
    echo "openvpn_restart: success"
    echo
    ifconfig tun0
    exit 0
  fi
  TRY=`expr $TRY + 1`
done

echo "openvpn_restart: failed"
exit 1
