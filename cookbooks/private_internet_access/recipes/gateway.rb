include_recipe 'private_internet_access'

previous_masquerade = node.set[:masquerade]

node.set[:masquerade] = previous_masquerade.map do |masq|
  masq.merge!({destination: 'tun0'})
end

iptables_rule_nat 'masquerade' do
  variables({
    'masquerade' => node[:masquerade]
  })
  cookbook 'iptables'
end
