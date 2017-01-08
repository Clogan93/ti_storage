# frozen_string_literal: true
# :nodoc:
class ReservationsController < ApplicationController
  def create
    storage_unit = StorageUnit.where(unit_id: params.fetch(:unit_id)).first
    if current_reservation
      current_reservation.update_attribute(:storage_unit, storage_unit)
    else
      @current_reservation = storage_unit.reservations.create
    end
    session[:r_id] = current_reservation.id
    redirect_to([:reservation])
  end

  def update
    current_reservation.assign_attributes(reservation_params)
    if current_reservation.save(context: :reserve)
      redirect_to([:reservation, :checkout])
    else
      render :show
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :first_name, :last_name,
      :move_in_date, :phone, :email
    )
  end

  def current_reservation
    @current_reservation ||= session[:r_id] && Reservation.find(session[:r_id])
  end
  helper_method :current_reservation
end
