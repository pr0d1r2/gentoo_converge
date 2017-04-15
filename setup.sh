#!/bin/sh

ADDRESS=$1
SSH="root@$ADDRESS"
TODAY=`date +%Y%m%d`

function run() {
  ssh $SSH $@ || return $?
}

cd `dirname $0`

run which layman &>/dev/null
if [ $? -gt 0 ]; then
  run emerge layman || exit $?
fi

run test -f /tmp/.layman-synced-$TODAY
if [ $? -gt 0 ]; then
  run layman -s ALL || exit $?
  run touch /tmp/.layman-synced-$TODAY
fi

run test -d /var/lib/layman/ssnb
if [ $? -gt 0 ]; then
  run layman -a ssnb || exit $?
fi

run test -d /etc/portage/package.keywords
if [ $? -gt 0 ]; then
  run mkdir /etc/portage/package.keywords
fi

run test -f /etc/portage/package.keywords/chefdk-omnibus
if [ $? -gt 0 ]; then
  run 'echo "app-admin/chefdk-omnibus ~amd64" > /etc/portage/package.keywords/chefdk-omnibus'
fi

run which chef-solo &>/dev/null
if [ $? -gt 0 ]; then
  run emerge chefdk-omnibus || exit $?
fi

run touch /etc/portage/package.keywords/default || exit $?

ssh-add -l | grep -q $ADDRESS
if [ $? -gt 0 ]; then
  if [ -f ~/.ssh/id_rsa_$ADDRESS ]; then
    ssh-add ~/.ssh/id_rsa_$ADDRESS
  fi
fi

berks vendor || exit $?
knife solo cook root@$ADDRESS || exit  $?

rsync -av root@$ADDRESS:/root/.ssh/id_rsa.pub cookbooks/ssh-key/files/default/$ADDRESS.pub || exit $?
cd cookbooks/ssh-key/files/default || exit $?
git commit -a -m "Add key for $ADDRESS" || exit $?
git push || exit $?
cd -
