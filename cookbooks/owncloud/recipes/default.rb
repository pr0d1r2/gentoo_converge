gentoo_package_keywords 'www-apps/owncloud' do
  keywords '~amd64'
end

gentoo_package_use 'dev-lang/php' do
  use 'pdo sqlite gd zip fpm curl xmlwriter xmlreader'
end

gentoo_package_use 'app-eselect/eselect-php' do
  use 'fpm'
end

package 'oniguruma'
package 'libmcrypt'
package 'sqlite'
package 'libatomic_ops'
package 'libjpeg-turbo'
package 'nullmailer'
package 'xmlto'
package 'php'
package 'webapp-config'

package 'owncloud' do
  timeout 3600 # TODO: seems it is not respected by chef
end
