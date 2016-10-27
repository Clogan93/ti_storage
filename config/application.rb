# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# for ES6
require 'action_view/railtie'
require 'sprockets/railtie'

module TiStorage
  class Application < Rails::Application
  end
end
