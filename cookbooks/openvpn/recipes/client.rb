include_recipe 'openvpn'
include_recipe 'crontab'

kernel_module 'CONFIG_TUN'

cookbook_file '/etc/cron.minutely/renice_openvpn_clients.sh' do
  source 'renice_openvpn_clients.sh'
  mode '0755'
end
