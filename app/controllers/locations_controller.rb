# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
    if params[:area_slug]
      @storages = @storages.where(area_slug: params[:area_slug])
    end
  end

  def show
    @storage = @storages.find_by(slug: params[:slug])
  end
end
