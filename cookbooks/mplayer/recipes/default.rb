include_recipe 'gentoo-support::portage_defaults'
include_recipe 'xorg-x11'

gentoo_package_use 'media-video/mplayer' do
  use 'a52 faac faad gif gsm jpeg libmpeg2 mad mp3 openal opengl png pnm samba tga theora twolame vorbis x264 xvid yuv4mpeg'
end
gentoo_package_use 'sys-libs/tdb' do
  use 'python'
end
gentoo_package_use 'sys-libs/tevent' do
  use 'python'
end

package 'media-video/mplayer'
