# StorageUnit
# frozen_string_literal: true
class StorageUnit < ApplicationRecord
  belongs_to :storage, foreign_key: :site_id, primary_key: :site_id

  has_many :reservations, foreign_key: :unit_id, primary_key: :unit_id

  scope :available, -> { where('total_units_in_available_status > 0') }

  def data
    @data ||= JSON.parse(self[:data], object_class: OpenStruct)
  end

  def dimensions
    @dimensions = [width, depth]
    @dimensions << height if height.positive?
    @dimensions.join("x")
  end

  def features
    @features ||= []
    @features << data.climate_value.titlecase if data.climate_value
    @features << data.attribute1_value.titlecase
    @features << data.access_value
    @features
  end
end
