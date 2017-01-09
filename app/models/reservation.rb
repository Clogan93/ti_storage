# frozen_string_literal: true
class Reservation < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, primary_key: :account_id
  belongs_to :storage_unit, foreign_key: :unit_id, primary_key: :unit_id
  has_one :storage, through: :storage_unit
  has_one :payment

  # validates_presence_of :move_in_date

  def card_cvv
  end
end
