# frozen_string_literal: true
# :nodoc:
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TiStorage
  # :nodoc:
  class Application < Rails::Application
    config.sites = config_for(:sites)
    config.meta = config_for(:meta)

    config.active_job.queue_adapter = :sidekiq
  end
end
