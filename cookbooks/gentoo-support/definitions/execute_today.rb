define :execute_today do
  command = params[:name]
  marker_dir = '/tmp/.execute_today'
  marker = "#{marker_dir}/#{command.gsub(/[^A-Za-z]/, '_')}"
  today = Time.now.strftime('%Y%m%d')

  directory marker_dir do
    mode '0700'
  end

  execute "#{command} && echo #{today} > #{marker}" do
    not_if { File.exist?(marker) && File.read(marker).include?(today) }
  end
end
