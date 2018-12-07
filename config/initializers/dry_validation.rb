Dry::Validation::Schema::Params.configure do |config|
  config.messages_file = Rails.root.join('config', 'locales', 'errors.yml')
  config.messages = :i18n
end
