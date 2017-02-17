include_recipe 'vixie-cron'

directory '/etc/cron.minutely' do
  owner 'root'
  group 'root'
  mode '0750'
end

directory '/etc/cron.every_morning' do
  owner 'root'
  group 'root'
  mode '0750'
end

directory '/etc/cron.every_5_minutes' do
  owner 'root'
  group 'root'
  mode '0750'
end

template '/etc/crontab' do
  source 'crontab.erb'
end

execute 'update-crontab' do
  command 'crontab /etc/crontab'
end
