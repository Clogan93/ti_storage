# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
    @storages =
      if params[:area_slug]
        @all_storages.where(area_slug: params[:area_slug])
      else
        @all_storages
      end
  end

  def show
    @storage = @all_storages.find_by(slug: params[:slug])
  end
end
