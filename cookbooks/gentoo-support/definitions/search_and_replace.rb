define :search_and_replace do
  execute "sed -i -e 's/#{params[:from]}/#{params[:to]}/#{params[:sed_param]}' #{params[:name]}"
end
