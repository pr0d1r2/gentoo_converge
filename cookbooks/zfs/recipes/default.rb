gentoo_package_keywords 'sys-fs/zfs' do
  keywords '~amd64'
end

include_recipe 'spl'
include_recipe 'zfs-kmod'

package 'zfs'
