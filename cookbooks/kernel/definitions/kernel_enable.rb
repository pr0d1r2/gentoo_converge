define :kernel_enable do
  config = '/usr/src/linux/.config'
  kernel_configs = [params[:name]].flatten.compact

  rebuild_kernel = false

  kernel_configs.each do |kernel_config|
    flag = "#{kernel_config}=y"

    rebuild_kernel = (system("grep -q '#{flag}' #{config}") != 0) if rebuild_kernel == false

    execute "echo '#{flag}' >> #{config}" do
      not_if { system("grep -q '#{flag}' #{config}") }
    end
  end

  if rebuild_kernel
    execute "make -C /usr/src/linux olddefconfig && genkernel bzImage # after #{params[:name]}=y"
  end
end
