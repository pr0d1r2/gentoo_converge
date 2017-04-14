include_recipe 'gentoo-support::portage_defaults'

gentoo_package_use 'net-misc/openvpn' do
  use 'passwordsave'
end

package 'openvpn'
