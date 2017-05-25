gentoo_package_use 'sys-libs/tevent' do
  use 'python'
end
gentoo_package_use 'sys-libs/tdb' do
  use 'python'
end
gentoo_package_use 'sys-libs/ntdb' do
  use 'python'
end

package 'net-fs/samba'

template '/etc/samba/smb.conf' do
  source 'smb.conf.erb'
  variables(node[:samba])
end

service 'samba' do
  service_name 'samba'
  supports :restart => true, :status => true, :reload => true
  action :enable
  subscribes :restart, resources(:template => '/etc/samba/smb.conf')
end
