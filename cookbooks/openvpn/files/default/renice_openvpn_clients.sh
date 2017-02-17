#!/bin/bash

renice -18 `ps -ax | grep /usr/sbin/openvpn | grep -v grep | cut -b 1-5`
