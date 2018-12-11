server 'ip',
       roles: %w[web app db],
       primary: true,
       user: 'your_system_user'

set :keep_releases, 10
set :puma_threads, [4, 4]
set :puma_workers, 8

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
