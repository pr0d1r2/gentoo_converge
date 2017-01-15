gentoo_package_keywords 'sys-kernel/spl' do
  keywords '~amd64'
end

kernel_enable 'CONFIG_CRYPTO_DEFLATE',
              'CONFIG_ZLIB_DEFLATE'

package 'spl'
