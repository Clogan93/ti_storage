# Storages (we call them /locations occasionaly).
# frozen_string_literal: true
class Storage < ApplicationRecord
  has_many :reviews

  validates_presence_of :category, :title, :phone,
    :address, :area, :zip_code, :coordinates,
    :office_hours, :access_hours,
    :description_1, :description_2, :directions, :features,
    :link_to_google, :link_to_yelp,
    :slug
  validates_uniqueness_of :slug

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
