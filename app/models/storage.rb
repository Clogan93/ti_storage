# frozen_string_literal: true
class Storage < ApplicationRecord

  has_many :reviews

  validates_presence_of :category, :title, :phone,
    :address, :area, :zip_code, :coordinates,
    :office_hours, :access_hours,
    :description, :directions, :features,
    :link_to_google, :link_to_yelp,
    :url
  validates_uniqueness_of :url

  serialize :coordinates, Array
  serialize :office_hours, Array
  serialize :access_hours, Array
  serialize :features, Array

  def full_address
    "#{address}, #{area}, #{zip_code}"
  end

  def self.categories
    Storage.all.map { |storage| storage[:category] }.uniq
  end
end
