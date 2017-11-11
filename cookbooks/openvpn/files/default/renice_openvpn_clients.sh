#!/bin/bash

pgrep openvpn | parallel "renice -18 {}"
