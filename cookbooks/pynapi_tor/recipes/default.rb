include_recipe 'tor'
include_recipe 'pynapi'
include_recipe 'torsocks'

template '/usr/local/bin/pynapi_tor'
