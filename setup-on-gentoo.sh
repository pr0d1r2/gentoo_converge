#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

berks vendor || exit $?

chef-solo -o "role[host]" -c "$D_R/solo.rb"
