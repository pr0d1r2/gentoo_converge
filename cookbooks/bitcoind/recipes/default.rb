include_recipe 'tor'

package 'net-p2p/bitcoind'

if node[:bitcoind][:wallet]
  search_and_replace '/etc/conf.d/bitcoind' do
    from '-disablewallet'
    to ''
  end
end

template '/etc/bitcoin/bitcoin.conf' do
  source 'bitcoin.conf.erb'
  variables(node[:bitcoind])
end

if default[:zfs_pools_require_mountpoints_mounted]
  # When using zfs_pools usually we put bitcoin data on gzip-9 compressed mountpoint
  # As zfs_pools is one of the first packages and it allow enforce filesystem mounts
  # we support this by starting it (but not enabling as after boot there is no ZFS mount)
  bitcoind_service_ction = [:start]
else
  bitcoind_service_ction = [:enable, :start]
end
service 'bitcoind' do
  action bitcoind_service_ction
  subscribes :restart, resources(package: 'net-p2p/bitcoind', template: '/etc/bitcoin/bitcoin.conf')
end
