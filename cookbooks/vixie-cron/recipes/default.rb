package 'sys-process/vixie-cron'

service 'vixie-cron' do
  action [:enable, :start]
end

if node.run_list?("recipe[monit]")
  monit_check "vixie-cron"
end

if node.run_list?("recipe[nagios::nrpe]")
  cron "touch /tmp/cron_lastrun" do
    minute "*/5"
    user "nagios"
    command "/bin/touch /tmp/cron_lastrun"
  end
  nrpe_command "vixie-cron"
end
