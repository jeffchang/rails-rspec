source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem "pg"

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem "guard-rspec"
  gem "guard-rails"
  gem "terminal-notifier-guard"
end

group :test do
  gem "factory_girl_rails"
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-livereload'
  gem 'rack-livereload'
end
