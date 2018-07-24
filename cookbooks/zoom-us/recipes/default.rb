include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_keywords 'net-im/zoom-bin' do
  keywords '~amd64'
end

directory '/etc/portage/package.unmask' do
  recursive true
end
execute 'touch /etc/portage/package.unmask/default'

gentoo_package_unmask 'media-libs/gst-plugins-base'

gentoo_package_use 'sys-libs/zlib' do
  use 'minizip'
end
gentoo_package_use 'dev-libs/libpcre2' do
  use 'pcre16'
end
gentoo_package_use 'media-libs/libvpx' do
  use 'svc'
end
gentoo_package_use 'x11-libs/libxkbcommon' do
  use 'X'
end
gentoo_package_use 'dev-libs/libxml2' do
  use 'icu2'
end
gentoo_package_use 'x11-libs/libxcb' do
  use 'xkb'
end
gentoo_package_use 'dev-qt/qtwebchannel' do
  use 'qml'
end

package 'net-im/zoom-bin'
