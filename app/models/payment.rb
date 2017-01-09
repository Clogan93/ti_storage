# frozen_string_literal: true
# :nodoc:
class Payment < ApplicationRecord
  belongs_to :reservation
  has_one :account, through: :reservation
end
