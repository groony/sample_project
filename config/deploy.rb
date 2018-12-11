# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'your_system_user'
set :repo_url, 'your_repo_url'
set :rbenv_ruby, '2.5.3'

# puma config
set :puma_worker_timeout, 30
set :puma_init_active_record, true
set :default_env, path: '~/.rbenv/shims:~/.rbenv/bin:$PATH'
set :puma_default_hooks, false
set :linked_files, fetch(:linked_files, []) + %w[config/master.key]
set :linked_dirs, fetch(:linked_dirs, []) + %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle tmp/storage storage]
set :deploy_to, -> { "/var/www/#{fetch(:application)}/ss" }

after 'deploy:started', 'puma:config'
