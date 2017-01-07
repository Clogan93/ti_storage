# frozen_string_literal: true
# :nodoc:
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TiStorage
  # :nodoc:
  class Application < Rails::Application
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              "smtp.gmail.com",
      port:                 587,
      user_name:            ENV['GMAIL_USERNAME'],
      password:             ENV['GMAIL_PASSWORD'],
      authentication:       "plain",
      enable_starttls_auto: true
    }
  end
end
