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

service 'bitcoind' do
  action [:enable, :start]
  subscribes :restart, resources(package: 'net-p2p/bitcoind', template: '/etc/bitcoin/bitcoin.conf')
end
