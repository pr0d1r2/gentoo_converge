include_recipe 'gentoo-support::portage_defaults'
include_recipe 'gentoo-support::filesystems'

include_recipe 'gentoo_package_masking'

package 'gentoolkit'
