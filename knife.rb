local_mode true

cookbook_path [
  File.expand_path('../cookbooks', __FILE__),
  File.expand_path('../berks-cookbooks', __FILE__)
]

knife[:before_bootstrap] = "berks vendor"
knife[:before_converge]  = "berks vendor"
