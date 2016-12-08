# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @all_storages = Storage.all
    @storage_categories = Storage.categories
  end
end
