include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_use 'x11-libs/cairo' do
  use 'xcb X' # only X really needed
end
gentoo_package_use 'media-libs/libpng' do
  use 'apng'
end
gentoo_package_use 'app-crypt/pinentry' do
  use 'gtk'
end
gentoo_package_use 'dev-lang/python' do
  use 'sqlite'
end

package 'mail-client/thunderbird'
