# frozen_string_literal: true
# locations == storages
class LocationsController < ApplicationController
  def index
    @category = find_category or return(redirect_to('/404'))
    @storages = @all_storages.where(category: @category)
  end

  def locations
  end

  def show
    @category = find_category or return(redirect_to('/404'))
    @storage = find_storage or return(redirect_to('/404'))
    @storage_units = @storage.storage_units.available.order(rent_rate: :asc)
  end

  private

  def find_category
    Category.find_by(slug: params[:category_slug])
  end

  def find_storage
    @all_storages.find_by(slug: params[:storage_slug])
  end
end
