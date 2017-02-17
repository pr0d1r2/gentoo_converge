include_recipe 'openvpn::client'
include_recipe 'openvpn'
include_recipe 'crontab'

%w(
  ca.crt
  crl.pem
).each do |pia_file|
  cookbook_file "/etc/openvpn/#{pia_file}" do
    source pia_file
    mode '0400'
  end
end

pia = node[:private_internet_access]

raise "Configure: node[:private_internet_access]" unless pia

pia_auth_file = '/etc/openvpn/openvpn.auth'

template pia_auth_file  do
  source "openvpn.auth.erb"
  mode '0400'
  variables({
    username: pia[:username],
    password: pia[:password],
  })
end

pia_conf_file = '/etc/openvpn/openvpn.conf'

template pia_conf_file do
  source "openvpn.conf.erb"
  mode '0400'
  variables({
    location: pia[:locations][pia[:location]],
    auth: pia_auth_file,
    port: pia[:port],
    proto: pia[:proto].downcase,
  })
end

service 'openvpn' do
  action :enable
end

openvpn_restart_script = '/usr/sbin/openvpn_restart'

cookbook_file openvpn_restart_script do
  source 'openvpn_restart.sh'
  mode '0755'
end

execute 'openvpn_restart' do
  command openvpn_restart_script
  action :nothing
  subscribes :run, resources(:template => pia_auth_file)
  subscribes :run, resources(:template => pia_conf_file)
end

template '/etc/cron.daily/openvpn_restart.sh' do
  source 'cron_openvpn_restart.sh.erb'
  mode '0755'
  variables({
    command: openvpn_restart_script
  })
end

template '/etc/cron.minutely/openvpn_guard.sh' do
  source 'cron_openvpn_guard.sh.erb'
  mode '0755'
  variables({
    command: openvpn_restart_script
  })
end
