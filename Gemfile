# typed: ignore

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.4'
gem 'puma', '~> 5.0'
gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'sorbet-runtime'
gem 'plaid', '~> 14.0.0.beta.5'
gem 'pg'
gem 'shopify-money'
gem 'sorbet-rails'
gem 'jwt'
gem 'sorbet-struct-comparable'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
  gem 'minitest-focus'
  gem 'mocha'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sorbet'
  gem 'rubocop'
  gem 'tapioca', require: false
end