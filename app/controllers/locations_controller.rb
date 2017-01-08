# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
    @category = Category.find_by(slug: params[:category_slug])
    @storages = @all_storages.where(category: @category)
  end

  def locations
  end

  def show
    @category = Category.find_by(slug: params[:category_slug])
    @storage = @all_storages.find_by(slug: params[:storage_slug])
    @storage_units = @storage.storage_units.available.order(rent_rate: :asc)
  end
end
