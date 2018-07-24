include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_use 'x11-libs/cairo' do
  use 'xcb X'
end
gentoo_package_use 'x11-libs/libxcb' do
  use 'xkb'
end
gentoo_package_use 'x11-libs/pango' do
  use 'X'
end
gentoo_package_use 'x11-libs/libxkbcommon' do
  use 'X'
end

package 'x11-wm/i3'
