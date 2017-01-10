# frozen_string_literal: true
# :nodoc:
class StorageUnitsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:reserve]

  def reserve
    @current_storage_unit = StorageUnit.find(params.fetch(:id))
    session[:su_id] = current_storage_unit.id
    redirect_to([:reservation])
  end
end
