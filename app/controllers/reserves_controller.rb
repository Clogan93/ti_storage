# frozen_string_literal: true
class ReservesController < ApplicationController
  def create
    site = Site::MAPPINGS[params.fetch(:site_id).to_sym]
    unit = UnitWithPromo.find(id: params.fetch(:unit_id), site_id: site.id)
    if unit.available?
      current_cart.update_attributes(
        site_id: site.id,
        unit_id: unit.id,
        unit_with_promo_data: unit
      )
      session[:c_id] = current_cart.id
      redirect_to([:reservation])
    end
  end
end
