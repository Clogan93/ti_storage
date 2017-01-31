# frozen_string_literal: true
# :nodoc:
class CheckoutsController < ApplicationController
  before_action :confirm_current_cart_exists
  before_action :redirect_unless_unit

  def show
    redirect_to([:reservation, :lease]) if current_cart.complete?
    @cart ||= CartPresenter.new(current_cart, view_context)
    @cart_form ||= CartFormPresenter.new(@cart, view_context)
  end

  def update
    current_cart.update_attributes(
      payment_params: payment_params
    )
    if current_cart.process_payment!
      current_cart.send_notifications
      flash[:c_id] = current_cart.id
      session[:c_id] = nil
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

  def redirect_unless_unit
    redirect_to [:reservation] unless current_unit.present?
  end
end
