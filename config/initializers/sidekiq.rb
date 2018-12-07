require 'sidekiq/web'

Sidekiq.default_worker_options = { backtrace: true, retry: true }

Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials.redis_url || 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials.redis_url || 'redis://localhost:6379/0' }
end

Sidekiq::Web.set :sessions, false
