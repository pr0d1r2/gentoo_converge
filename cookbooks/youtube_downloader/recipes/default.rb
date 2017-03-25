include_recipe 'torsocks'

# Allow to actually download via TOR
search_and_replace '/etc/tor/torsocks.conf' do
  from '#AllowOutboundLocalhost 1'
  to 'AllowOutboundLocalhost 1'
end

package 'net-misc/youtube-dl' do
  action :upgrade
end
