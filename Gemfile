# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.1', '>= 5.2.1.1'

# Persistence
gem 'pg', '>= 0.18', '< 2.0'

gem 'bootsnap', '>= 1.1.0', require: false

# Domain logic support
gem 'mini_magick', '~> 4.9'
gem 'performify', github: 'trickstersio/performify'

# Build JSON APIs
gem 'fast_jsonapi', '~> 1.5'

# Admin area
gem 'activeadmin', '~> 1.4'
gem 'activeadmin_addons', '~> 1.6'
gem 'devise', '> 4.x'

# MarkUps & Gallery
gem 'slim-rails', '~> 3.2.0'

# Scheduling and background jobs
gem 'sidekiq', '~> 5.2.3'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
  gem 'faker', '~> 1.9'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Code styling
  gem 'rubocop', '~> 0.60'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'shoulda-matchers', '~> 3.1', require: false
  gem 'test-prof', '~> 0.7.3'
end

# Console tweaks
group :console do
  gem 'awesome_print', github: 'awesome-print/awesome_print'
  gem 'hirb'
end

# Servers
group :production do
  gem 'puma', '~> 3.11'
end

gem 'activerecord-import', '~> 0.27.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
