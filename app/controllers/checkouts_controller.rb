# frozen_string_literal: true
# :nodoc:
class CheckoutsController < ApplicationController
  def show
    @cart ||= CartPresenter.new(current_cart, view_context)
    @cart_form ||= CartFormPresenter.new(@cart, view_context)
  end

  def update
    current_cart.update_attributes(
      payment_params: payment_params
    )
    if current_cart.process_payment!
      redirect_to([:reservation, :lease])
    else
      render(:show)
    end
  end

  private

  def payment_params
    params.require(:payment).permit(
      :card_holder_name, :card_number,
      :expire_month, :expire_year, :cvv2, :postal_code
    )
  end
end
