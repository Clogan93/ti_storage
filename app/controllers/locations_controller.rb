# frozen_string_literal: true
# :nodoc:
class LocationsController < ApplicationController
  def index
  end

  def show
    @storage = Storage.find_by(url: params[:id])
  end
end
