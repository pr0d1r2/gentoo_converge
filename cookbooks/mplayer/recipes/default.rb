gentoo_package_use 'media-video/mplayer' do
  use %w[
    faac faad gif jpeg jpeg2k libmpeg2 mad mp3 png pnm samba
    speex tga theora toolame twolame vorbis x264 xvid yuv4mpeg
  ].join(' ')
end

package 'media-video/mplayer'
