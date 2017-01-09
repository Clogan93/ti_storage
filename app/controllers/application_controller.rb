# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @all_storages = Storage.all
    @all_categories = Category.all
  end

  private

  def current_reservation
    @current_reservation ||= session[:r_id] && Reservation.find(session[:r_id])
  end
  helper_method :current_reservation

  def current_account
    @current_account ||= session[:a_id] && Account.find(session[:a_id])
  end
  helper_method :current_account

  def current_address
    @current_address ||= current_account && current_account.addresses.first
  end
  helper_method :current_address

  def current_phone
    @current_phone ||= current_account && current_account.phones.first
  end
  helper_method :current_phone

  def current_storage_unit
    @current_storage_unit ||=
      session[:su_id] && StorageUnit.find(session[:su_id])
  end
  helper_method :current_storage_unit

  def current_payment
    @current_payment ||=
      current_reservation && current_reservation.payment
  end
  helper_method :current_payment

  def update_session
    session[:r_id] = current_reservation.id
    session[:a_id] = current_account.id
    session[:su_id] = current_storage_unit.id
  end
end
