include_recipe 'gentoo-support::portage_defaults'
include_recipe 'openssl'

gentoo_package_use 'net-misc/tor' do
  use 'web'
end

package 'tor'

service 'tor' do
  action [:enable, :start]
end
