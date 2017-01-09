# frozen_string_literal: true
# :nodoc:
class Account < ApplicationRecord
  has_many :reservations, foreign_key: :account_id, primary_key: :account_id
  has_many :addresses, foreign_key: :contact_id, primary_key: :contact_id
  has_one :address, -> { order(created_at: :desc) },
    foreign_key: :contact_id, primary_key: :contact_id
  has_many :phones, foreign_key: :contact_id, primary_key: :contact_id
  has_one :phone, -> { order(created_at: :desc) },
    foreign_key: :contact_id, primary_key: :contact_id

  validates_presence_of :first_name, :last_name, :email

  def name
    [first_name, last_name].join(" ")
  end
end
