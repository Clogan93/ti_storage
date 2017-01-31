# frozen_string_literal: true
# :nodoc:
class ReservationsController < ApplicationController
  def show
    redirect_to([:reservation, :lease]) if current_cart.complete?
    @cart = CartPresenter.new(current_cart, view_context)
    @cart_form = CartFormPresenter.new(current_cart, view_context)
  end

  def create
    handle_request
  end

  def update
    handle_request
  end

  def handle_request
    current_cart.update_attributes(
      cart_params.merge({
        account_params: account_params,
        address_params: address_params,
        phone_params: phone_params
      })
    )

    current_cart.process_account!
    current_cart.process_reservation!
    self.send(transaction_type)
  end

  def reserve
    current_cart.send_notifications
    flash[:c_id] = current_cart.id
    session[:c_id] = nil
    redirect_to([:reservation, :lease])
  end

  def rent
    current_cart.process_insurance!
    current_cart.process_assessments!
    current_cart.process_total_due!

    redirect_to([:reservation, :checkout])
  rescue Savon::SOAPFault => error
    reason = error.to_hash[:fault][:faultstring]
    case
    when reason.include?("unit is not available")
      redirect_to([:reservation], alert: "That unit is no longer available.")
    when reason.include?("expired, cancelled or rented")
      current_cart.reset_reservation
      current_cart.process_reservation!
      current_cart.process_insurance!
      current_cart.process_assessments!
      current_cart.process_total_due!
    else
      raise
    end
  end

  private

  def transaction_type
    params.dig(:cart, :reservation_type).to_sym
  end

  def cart_params
    params.require(:cart).permit(:reservation_type, :move_in_date, :need_help_moving)
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :email)
  end

  def address_params
    params.require(:address).permit(
      :address_1, :address_2, :city, :state, :postal_code
    )
  end

  def phone_params
    params.require(:phone).permit(:number)
  end
end
