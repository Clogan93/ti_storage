# frozen_string_literal: true
class LeasesController < ApplicationController
  before_action :confirm_current_cart_exists

  def show
    @cart = CartPresenter.new(Cart.find(flash[:c_id]), view_context)
  end
end
