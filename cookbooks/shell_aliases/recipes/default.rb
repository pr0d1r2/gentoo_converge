directory '/root/projects'

execute 'update-ca-certificates'

git '/root/projects/shell_aliases_compiler' do
  repository 'https://github.com/pr0d1r2/shell_aliases_compiler.git'
  revision 'master'
  action :sync
end

template '/root/projects/shell_aliases_compiler/.config.sh' do
  source 'config.sh.erb'
  variables node[:shell_aliases]
end

execute 'cd /root/projects/shell_aliases_compiler && git checkout master'

execute '/root/projects/shell_aliases_compiler/setup.sh'

execute 'cp /root/.compiled_shell_aliases.sh /etc/profile.d/compiled_shell_aliases.sh'
