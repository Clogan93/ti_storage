# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
# bootstrap's tooltips and popovers depend on tether for positioning:
gem 'rails-assets-tether'
gem 'bootstrap', '~> 4.0.0.alpha4'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'inline_svg'

# gem 'wicked' # maybe an okay solution for wizard form

gem 'react-rails'
gem 'sprockets'

gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'

gem 'dotenv-rails'

# gem 'devise'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.5.0.beta4'
  gem 'capybara', '~> 2.5'
  gem 'rubocop', require: false
  gem 'faker', '~> 1.6.1'
  gem 'factory_girl_rails', '~> 4.5.0'

  gem 'pry'
  gem 'pry-rescue'
  gem 'pry-rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # gem "better_errors"
  # gem "binding_of_caller"
end
