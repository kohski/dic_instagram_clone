server '3.112.180.71', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kosukekimura/.ssh/id_rsa'