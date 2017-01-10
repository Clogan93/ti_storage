# frozen_string_literal: true
# :nodoc:
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TiStorage
  # :nodoc:
  class Application < Rails::Application
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:        'auth.smtp.1and1.co.uk',
      domain:         '1and1.com',
      port:           587,
      authentication: 'login',
      user_name:      ENV['EMAIL_USER_NAME'],
      password:       ENV['EMAIL_PASSWORD']
    }

    config.exceptions_app = self.routes
  end
end
