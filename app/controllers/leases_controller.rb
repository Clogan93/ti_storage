# frozen_string_literal: true
class LeasesController < ApplicationController
  def show
    @cart = CartPresenter.new(current_cart, view_context)
  end
end
