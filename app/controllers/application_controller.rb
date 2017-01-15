# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def all_sites
    @all_sites ||= Rails.cache.fetch(:all_sites, expires_in: 5.minutes) do
      Site.all.map { |site| SitePresenter.new(site, view_context) }
    end
  end
  helper_method :all_sites

  def all_sites_by_area
    @all_sites_by_area ||= Rails.cache.fetch(:all_sites_by_area, expires_in: 5.minutes) do
      sites_by_area ||= {}
      all_sites.each do |site|
        sites_by_area[site.area.slug] ||= {}
        sites_by_area[site.area.slug][:area] = AreaPresenter.new(site.area, view_context)
        sites_by_area[site.area.slug][:sites] ||= []
        sites_by_area[site.area.slug][:sites] << site
      end
      [sites_by_area[:brooklyn], sites_by_area[:queens], sites_by_area[:"new-jersey"]]
    end
  end
  helper_method :all_sites_by_area

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

  def current_cart
    @current_cart ||= session[:c_id] && Cart.where(id: session[:c_id]).first || Cart.new
  end
  helper_method :current_cart

  def current_unit
    @current_unit ||= current_cart && current_cart.unit
  end
  helper_method :current_unit

  def update_session
    session[:r_id] = current_reservation.id
    session[:a_id] = current_account.id
    session[:su_id] = current_storage_unit.id
  end
end
