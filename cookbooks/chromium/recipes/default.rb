include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_use 'x11-libs/cairo' do
  use 'xcb X'
end
gentoo_package_use 'dev-libs/libxml2' do
  use 'icu'
end
gentoo_package_use 'app-text/xmlto' do
  use 'text'
end
gentoo_package_use 'sys-libs/zlib' do
  use 'minizip'
end
gentoo_package_use 'media-libs/harfbuzz' do
  use 'icu'
end

kernel_enable 'CONFIG_USER_NS'

package 'www-client/chromium'
