#!/bin/bash

ADDRESS=$1
SSH="root@$ADDRESS"
TODAY=$(date +%Y%m%d)

function run() {
  # shellcheck disable=2068
  ssh "$SSH" $@ || return $?
}

cd "$(dirname "$0")" || exit $?

run which layman &>/dev/null || run emerge layman || exit $?


if ! (run test -f "/tmp/.layman-synced-$TODAY"); then
  run layman -s ALL || exit $?
  run touch "/tmp/.layman-synced-$TODAY"
fi

run test -d /var/lib/layman/ssnb || run layman -a ssnb || exit $?

run test -d /etc/portage/package.keywords || run mkdir /etc/portage/package.keywords

run test -f /etc/portage/package.keywords/chefdk-omnibus || \
  run 'echo "app-admin/chefdk-omnibus ~amd64" > /etc/portage/package.keywords/chefdk-omnibus'

run which chef-solo &>/dev/null || run emerge chefdk-omnibus || exit $?

run touch /etc/portage/package.keywords/default || exit $?

ssh-add -l | grep -q "$ADDRESS" || test -f "$HOME/.ssh/id_rsa_$ADDRESS" && ssh-add "$HOME/.ssh/id_rsa_$ADDRESS"

berks vendor || exit $?
knife solo cook "root@$ADDRESS" || exit  $?

rsync -av "root@$ADDRESS:/root/.ssh/id_rsa.pub" "cookbooks/ssh-key/files/default/$ADDRESS.pub" || exit $?
cd cookbooks/ssh-key/files/default || exit $?
git commit -a -m "Add key for $ADDRESS" || exit $?
git push || exit $?
cd - || exit $?
