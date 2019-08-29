source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# API versions
gem 'api-versions', '~> 1.0'
# Use Active Model Serializers for model serialization https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers', '~> 0.10.0'
# API error handling
gem 'api_error_handler', '~> 0.2.0'
# Auto strip attributes
gem 'auto_strip_attributes', '~> 2.5'
# WebSocket tranmiting
gem 'anycable-rails', '~> 0.6.4'
# Nenv
gem 'nenv', '~> 0.3.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'shoulda-matchers', '~> 4.1.2'
  gem 'faker', '~> 2.2.0'
  gem 'database_cleaner', '~> 1.7.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
