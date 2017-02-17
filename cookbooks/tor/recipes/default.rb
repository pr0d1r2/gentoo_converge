include_recipe 'openssl'

package 'tor'

service 'tor' do
  action [:enable, :start]
end
