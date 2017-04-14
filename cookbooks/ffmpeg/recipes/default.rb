include_recipe 'gentoo-support::portage_defaults'

gentoo_package_use 'media-video/ffmpeg' do
  use 'network aac aacplus faac mp3 speex theora twolame vorbis wavpack webp x264 x265 xvid'
end

cpu_flags_x86_enable 'mmxext'

package 'media-video/ffmpeg'
