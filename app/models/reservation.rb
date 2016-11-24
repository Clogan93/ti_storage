# frozen_string_literal: true
class Reservation < ApplicationRecord
  validates_presence_of :first_name, :last_name
    #:type,
    # :move_in_date,
    # :phone, :email
  validates_presence_of :card_name, unless: :step_1

  # for different validations in different steps in /checkout controller
  attr_accessor :step_1
end
