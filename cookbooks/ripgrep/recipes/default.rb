gentoo_package_keywords 'sys-apps/ripgrep' do
  keywords '~amd64'
end

include_recipe 'cargo'

package 'sys-apps/ripgrep'
