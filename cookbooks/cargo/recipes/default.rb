gentoo_package_keywords 'dev-util/cargo' do
  keywords '~amd64'
end

include_recipe 'rust'

package 'dev-util/cargo'
