server '52.196.140.236', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kosukekimura/.ssh/id_rsa'