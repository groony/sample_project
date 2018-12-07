# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module SampleProject
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true
    config.middleware.use ActionDispatch::Flash
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru

    routes.default_url_options = { host: Rails.application.credentials.host }

    # Set url host to mailers views
    config.action_mailer.default_url_options = { host: Rails.application.credentials.host }

    # Disable unnecessary generators
    config.generators do |g|
      g.assets = false
      g.helper = false
    end

    # Enable console tweaks
    console do
      Bundler.require(:console)
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      AwesomePrint.irb! if defined?(::AwesomePrint)
      Hirb.enable if defined?(::Hirb)
    end

    config.autoload_paths += %W[#{config.root}/app/serializers #{config.root}/app/workers]
  end
end
