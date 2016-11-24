# Storage's reviews taken from Yelp and Google+.
# frozen_string_literal: true
class Review < ApplicationRecord
  belongs_to :storage

  validates :written_via, inclusion: { in: ['Yelp', 'Google+'] }
  validates :rating, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
  validates_presence_of :comment,
    :written_by, :written_via,
    :published_at,
    :rating, :storage
end
