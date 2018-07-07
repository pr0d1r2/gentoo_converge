define :execute_once do
  command = params[:name]
  marker_dir = '/var/execute_once'
  marker = "#{marker_dir}/#{command.gsub(/[^A-Za-z]/, '_')}"

  directory marker_dir do
    mode '0700'
  end

  execute "#{command} && touch #{marker}" do
    not_if { File.exist?(marker) }
  end
end
