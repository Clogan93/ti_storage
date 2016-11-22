# frozen_string_literal: true
# :nodoc:
class CheckoutController < ApplicationController
  before_action { @header_navigation_is_hidden = true }

  def new
    session[:current_step] ||= 1
    reservation_params = session[:reservation_params]

    case session[:current_step]
    when 1
      if reservation_params
        @reservation = Reservation.new(reservation_params)
        @reservation.valid?
      else
        @reservation = Reservation.new
      end
    when 2
      @reservation = Reservation.new(reservation_params)
      @reservation.valid?
    when 3
      @reservation = Reservation.find(session[:reservation_id])
      session[:reservation_id] = nil
      session[:current_step] = nil
      session[:reservation_params] = nil
    end
  end

  def step_1
    if Reservation.new(step_1_params).valid?
      session[:current_step] = 2
    end

    session[:reservation_params] = step_1_params
    redirect_to action: :new
  end

  def step_2
    reservation = Reservation.new(step_2_params)
    if reservation.save
      session[:reservation_id] = reservation.id
      session[:current_step] = 3
      redirect_to action: :new
    else
      session[:reservation_params] = step_2_params
      redirect_to action: :new
    end
  end

  private
    def step_1_params
      params.require(:reservation).permit(:type, :first_name, :last_name, :move_in_date, :phone, :email).merge({ step_1: true })
    end

    def step_2_params
      session[:reservation_params].
        merge({ step_1: false }).
        merge(params.require(:reservation).permit(:card_name))
    end
end
