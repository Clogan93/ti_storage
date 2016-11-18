# frozen_string_literal: true
# :nodoc:
class CheckoutController < ApplicationController
  def new
    @reservation = Reservation.new
    @header_navigation_is_hidden = true
  end
end
