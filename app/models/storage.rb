# frozen_string_literal: true
# TODO: Rubocop treats comment as constant?
# Storages (we call them /locations occasionaly).

# columns
# link_to_google_reviews: seeded manually,
# because supposedly it can't be generated from CID (?)
class Storage < ApplicationRecord
  validates_presence_of :title, :phone, :slug,
    :address, :area, :zip_code, :coordinates,
    :office_hours, :access_hours,
    :description_1, :description_2, :directions, :features,
    :link_to_google_maps, :link_to_yelp, :link_to_google_reviews,
    :category
  validates_uniqueness_of :slug

  serialize :coordinates, Array
  serialize :office_hours, Array
  serialize :access_hours, Array
  serialize :features, Array

  belongs_to :category

  has_many :storage_units, foreign_key: :site_id, primary_key: :site_id
  has_many :reservations, through: :storage_units

  def image_src
    ActionController::Base.helpers.asset_path("_db/storages/#{slug}.jpg")
  end

  def url
    '/' + category.slug + '/' + slug
  end

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
      methods: [
        :image_src,
        :url,
        :min_unit_price,
        :storage_units
      ]
    }.update(options)
    super(options)
  end

  def data
    @data ||= JSON.parse(self[:data], object_class: DataStruct)
  rescue
    nil
  end

  def email
    "#{slug.delete('-')}@tistorage.com"
  end
end
