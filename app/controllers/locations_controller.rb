# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
    @storages = STORAGES
  end

  def show
    @storage = STORAGES[params[:id].to_i]
  end
end
