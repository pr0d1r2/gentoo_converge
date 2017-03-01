define :cpu_flags_x86_enable do
  config = '/etc/portage/make.conf'
  flag = params[:name]
  execute "sed -i #{config} -e 's/CPU_FLAGS_X86=\"/CPU_FLAGS_X86=\"#{flag} /'" do
    not_if { system("grep -q \"CPU_FLAGS_X86=.*#{flag} \" #{config}") || system("grep -q \"CPU_FLAGS_X86=.*#{flag}\\\"\" #{config}") }
  end
end
