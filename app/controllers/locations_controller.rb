# frozen_string_literal: true
# locations == storages
class LocationsController < ApplicationController
  def index
    @category = find_category or return
    @storages = @all_storages.where(category: @category)
  end

  def locations
  end

  def show
    @category = find_category or return
    @storage = find_storage or return
    @storage_units = @storage.storage_units.available.order(rent_rate: :asc)
  end

  private

  def find_category
    if category = Category.find_by(slug: params[:category_slug])
      category
    else
      redirect_to '/404' and return
    end
  end

  def find_storage
    if storage = @all_storages.find_by(slug: params[:storage_slug])
      storage
    else
      redirect_to '/404' and return
    end
  end
end
