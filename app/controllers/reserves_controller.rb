# frozen_string_literal: true
class ReservesController < ApplicationController
  def create
    site = Site::MAPPINGS[params.fetch(:site_id).to_sym]
    unit = site.units.where(id: params.fetch(:unit_id).to_i).first
    insurance_provider = site.default_insurance_provider

    if unit.available?
      if current_cart.update_attributes(
          site_id: site.id,
          unit_id: unit.id,
          unit_data: unit,
          insurance_option_id: insurance_provider.id,
          insurance_provider_data: insurance_provider,
        )
        session[:e_at] = Time.current + 5.minutes
        session[:c_id] = current_cart.id
        redirect_to([:reservation])
      else
        redirect(:back)
      end
    end
  end
end
