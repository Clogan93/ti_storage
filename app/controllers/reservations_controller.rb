# frozen_string_literal: true
# :nodoc:
class ReservationsController < ApplicationController
  def show
    @current_reservation ||=
      current_storage_unit && current_storage_unit.reservations.new
  end

  def create
    handle_request
  end

  def update
    handle_request
  end

  def handle_request
    request = Reservationist::Reserve.new(request_attributes).call
    if request
      @current_reservation = request.reservation
      @current_account = request.account
      update_session
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

  def reservation_params
    params.require(:reservation).permit(:move_in_date)
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :phone, :email)
  end

  def address_params
    params.require(:address).permit(
      :address_1, :address_2, :city, :state, :postal_code
    )
  end

  def phone_params
    params.require(:phone).permit(:phone)
  end
end
