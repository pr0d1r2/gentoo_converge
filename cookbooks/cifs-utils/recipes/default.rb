include_recipe 'gentoo-support::portage_defaults'
include_recipe 'libpcap'

gentoo_package_use 'sys-libs/tevent' do
  use 'python'
end
gentoo_package_use 'sys-libs/tdb' do
  use 'python'
end

kernel_enable 'CONFIG_CIFS'

package 'net-fs/cifs-utils'
