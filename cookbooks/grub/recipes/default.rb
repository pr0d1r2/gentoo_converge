gentoo_package_use 'sys-boot/grub' do
  use 'device-mapper'
end

package 'sys-boot/grub'

link '/usr/sbin/grub2-install' do
  to '/usr/sbin/grub-install'
end
