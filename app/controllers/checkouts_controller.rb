# frozen_string_literal: true
# :nodoc:
class CheckoutsController < ApplicationController
  def update
    request = Reservationist::Pay.new(request_attributes).call
    if request
      redirect_to([:reservation, :lease])
    else
      render(:show)
    end
  end

  private

  def request_attributes
    {
      reservation: current_reservation,
      payment_params: payment_params
    }
  end

  def payment_params
    params.require(:payment).permit(
      :card_holder_name, :card_number,
      :expire_month, :expire_year, :cvv2, :postal_code
    )
  end
end
