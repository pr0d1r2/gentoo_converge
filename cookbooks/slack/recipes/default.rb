include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_keywords 'net-im/slack-bin' do
  keywords '~amd64'
end

gentoo_package_use 'app-crypt/pinentry' do
  use 'gnome-keyring'
end
gentoo_package_use 'app-text/ghostscript-gpl' do
  use 'cups'
end
gentoo_package_use 'x11-libs/cairo' do
  use 'X'
end
gentoo_package_use 'app-crypt/gcr' do
  use 'gtk'
end

package 'net-im/slack-bin'
