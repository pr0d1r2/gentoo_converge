#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

berks vendor || exit $?

if [ ! -d /var/chef ]; then
  mkdir /var/chef || exit $?
fi

for COOKBOOK_DIR in berks-cookbooks cookbooks
do
  rsync -av $D_R/$COOKBOOK_DIR/ /var/chef/cookbooks/ || exit $?
done

if [ -f $D_R/node.json ]; then
  cp -rvdp $D_R/node.json /var/chef/node.json || exit $?
else
  echo "There is no '$D_R/node.json', aborting ..."
  exit 8472
fi
