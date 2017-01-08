# frozen_string_literal: true
class Reservation < ApplicationRecord
  belongs_to :storage_unit, foreign_key: :unit_id, primary_key: :unit_id
  has_one :storage, through: :storage_unit

  validates_presence_of :first_name, :last_name, :phone, :email, :move_in_date, on: :reserve
  validates_presence_of :card_name, on: :checkout

  # for different validations in different steps in /checkout controller
  # attr_accessor :step_1

  # temporary, while we don't know how it will be implemented
  def card_cvv
  end
end
