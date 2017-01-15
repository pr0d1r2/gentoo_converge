include_recipe 'gentoo_package_masking'

execute 'touch /etc/portage/package.use/default'

package 'gentoolkit'

package 'eix'
execute_today 'eix-update'
