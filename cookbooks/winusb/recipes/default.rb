kernel_module 'CONFIG_UDF_FS'

include_recipe 'grub'
include_recipe 'ntfs3g'

package 'sys-boot/winusb'
