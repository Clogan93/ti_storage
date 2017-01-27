# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def all_sites
    @all_sites ||= Site.all.map { |site| SitePresenter.new(site, view_context) }
  end
  helper_method :all_sites

  def all_sites_by_area
    @all_sites_by_area ||= begin
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

  def current_cart
    session[:c_id] = nil if current_cart_expired?
    @current_cart ||= session[:c_id] && Cart.where(id: session[:c_id]).first || Cart.new
  end
  helper_method :current_cart

  def current_unit
    @current_unit ||= current_cart && current_cart.unit
  end
  helper_method :current_unit

  def current_cart_expired?
    session[:e_at].blank? || session[:e_at] < Time.current
  end

  def confirm_current_cart_exists
    redirect_to [:reservation] if current_cart_expired?
  end
end
