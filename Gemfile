# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'rails-assets-tether' # bootstrap Tooltips and popovers depend on tether for positioning
gem 'bootstrap', '~> 4.0.0.alpha4'
gem 'jquery-rails'

gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'

gem 'uglifier', '>= 1.3.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5.0.beta4'
  gem 'capybara', '~> 2.5'
  gem 'rubocop', require: false
  gem 'faker', '~> 1.6.1'
  gem 'factory_girl_rails', '~> 4.5.0'
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
end
