include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_use 'app-editors/gvim' do
  use 'lua perl python ruby'
end


package 'app-editors/gvim'
