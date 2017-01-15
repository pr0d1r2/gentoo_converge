#!/bin/sh

ADDRESS=$1
SSH="root@$ADDRESS"

function run() {
  ssh $SSH $@ || return $?
}

cd `dirname $0`

if [ ! -e nodes/$ADDRESS.layman-installed ]; then
  run which layman
  if [ $? -gt 0 ]; then
    run emerge layman || exit $?
  fi
  touch nodes/$ADDRESS.layman-installed
fi

if [ ! -e nodes/$ADDRESS.layman-synced ]; then
  run layman -s ALL || exit $?
  touch nodes/$ADDRESS.layman-synced
fi

if [ ! -e nodes/$ADDRESS.layman-add-ssnb ]; then
  run test -d /var/lib/layman/ssnb
  if [ $? -gt 0 ]; then
    run layman -a ssnb || exit $?
  fi
  touch nodes/$ADDRESS.layman-add-ssnb
fi

if [ ! -e nodes/$ADDRESS.layman-sourced ]; then
  run grep -q /var/lib/layman/make.conf /etc/portage/make.conf
  if [ $? -gt 0 ]; then
    run 'echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf' || exit $?
  fi
  touch nodes/$ADDRESS.layman-sourced
fi

if [ ! -e nodes/$ADDRESS.chefdk-omnibus-keywords ]; then
  run mkdir /etc/portage/package.keywords
  run 'echo "app-admin/chefdk-omnibus ~amd64" > /etc/portage/package.keywords/chefdk-omnibus'
  touch nodes/$ADDRESS.chefdk-omnibus-keywords
fi

if [ ! -e nodes/$ADDRESS.chefdk-omnibus-installed ]; then
  run which chef-solo
  if [ $? -gt 0 ]; then
    run emerge chefdk-omnibus || exit $?
    touch nodes/$ADDRESS.chefdk-omnibus-installed
  fi
fi

run touch /etc/portage/package.keywords/default || exit $?

berks vendor || exit $?
knife solo cook root@$ADDRESS || exit  $?

rsync -av root@$ADDRESS:/root/.ssh/id_rsa.pub cookbooks/ssh-key/files/default/$ADDRESS.pub || exit $?
cd cookbooks/ssh-key/files/default || exit $?
git commit -a -m "Add key for $ADDRESS" || exit $?
git push || exit $?
cd -
