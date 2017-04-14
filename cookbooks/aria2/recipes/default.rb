include_recipe 'gentoo-support::portage_defaults'

gentoo_package_use 'net-misc/aria2' do
  use 'bittorrent'
end

package 'net-misc/aria2'
