# frozen_string_literal: true
# :nodoc:
class CheckoutsController < ApplicationController
  def update
    current_reservation.assign_attributes(checkout_params)
    if current_reservation.save(context: :checkout)
      redirect_to([:reservation, :lease])
    else
      render(:show)
    end
  end

  private

  def checkout_params
    params.require(:reservation).permit(:card_name, :card_number, :coupon_code)
  end
end
