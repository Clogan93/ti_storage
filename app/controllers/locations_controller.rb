# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
  end

  def show
    @storage = Storage.find_by(url: params[:id])
  end

  def nj
    @storages = @storages.where(category: 'New Jersey')
    render :index
  end

  def queens
    @storages = @storages.where(category: 'Brooklyn, NY')
    render :index
  end

  def brooklyn
    @storages = @storages.where(category: 'Queens, NY')
    render :index
  end
end
