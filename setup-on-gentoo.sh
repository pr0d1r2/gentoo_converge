#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

cd $D_R || exit $?
berks vendor || exit $?

chef-solo -c "$D_R/solo.rb"
