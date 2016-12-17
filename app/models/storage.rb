# Storages (we call them /locations occasionaly).
# frozen_string_literal: true
class Storage < ApplicationRecord
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

  # ugh, maybe we should add area_name to db then too. possible TODO
  # possibly not consistent enough to be calculating slugs from titles etc.
  def area_name
    area_slug.split('-').join(' ').titleize
  end

  def image_src
    ActionController::Base.helpers.asset_path("common/storages/#{id}.jpg")
  end

  def url
    '/' + area_slug + '/' + slug
  end

  # (because not enough info on units yet)
  def min_unit_price
    case title
    when 'Jamaica', 'Ozone Park', 'Paterson'
      19
    when 'Red Hook'
      29
    when 'Woodbridge'
      39
    end
  end

  # http://stackoverflow.com/a/9649359/3192470
  def serializable_hash(options = {})
    options = {
      methods: [:image_src, :url]
    }.update(options)
    super(options)
  end
end
