include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_keywords 'dev-util/patchelf' do
  keywords '~amd64'
end
gentoo_package_keywords 'media-sound/spotify' do
  keywords '~amd64'
end

gentoo_package_use 'app-text/ghostscript-gpl' do
  use 'cups'
end
gentoo_package_use 'dev-libs/libxml2' do
  use 'python'
end
gentoo_package_use 'x11-libs/cairo' do
  use 'X'
end

package 'media-sound/spotify'
