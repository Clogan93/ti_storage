# frozen_string_literal: true
# :nodoc:
class ReservationsController < ApplicationController
  def show
    @cart ||= CartPresenter.new(current_cart, view_context)
    @cart_form ||= CartFormPresenter.new(current_cart, view_context)
  end

  def create
    handle_request
  end

  def update
    handle_request
  end

  def handle_request
    current_cart.update_attributes(
      move_in_date: cart_params.fetch(:move_in_date),
      account_params: account_params,
      address_params: address_params,
      phone_params: phone_params
    )

    if current_cart.process_account!
      redirect_to([:reservation, :checkout])
    else
      render(:show)
    end
  end

  private

  def request_attributes
    {
      storage_unit: current_storage_unit,
      account: current_account,
      account_params: account_params,
      reservation: current_reservation,
      reservation_params: reservation_params,
      address_params: address_params,
      phone_params: phone_params
    }
  end

  def cart_params
    params.require(:cart).permit(:reservation_type, :move_in_date)
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
