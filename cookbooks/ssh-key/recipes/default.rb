execute "ssh-keygen -b 4096 -f /root/.ssh/id_rsa -C root@#{node[:hostname]} -o -a 500 -N ''" do
  not_if { File.exist?('/root/.ssh/id_rsa') }
end

execute 'echo -n > /root/.ssh/authorized_keys'

[node[:ipaddress], node[:authorized_keys]].flatten.compact.each do |authorized_key|
  cookbook_file "/root/.ssh/#{authorized_key}.pub" do
    source "#{authorized_key}.pub"
    mode '0400'
  end

  execute "cat /root/.ssh/#{authorized_key}.pub >> /root/.ssh/authorized_keys"
end
