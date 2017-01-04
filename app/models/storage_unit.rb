# StorageUnit
# frozen_string_literal: true
class StorageUnit < ApplicationRecord
  belongs_to :storage, foreign_key: :site_id, primary_key: :site_id

  def data
    @data ||= JSON.parse(self[:data], object_class: OpenStruct)
  end

  def width
    data.width.to_i
  end

  def height
    data.height.to_i
  end

  def depth
    data.depth.to_i
  end

  def dimensions
    [depth, width, height].join("x")
  end

  def features
    @features ||= []
    @features << data.climate_value.titlecase if data.climate_value
    @features << data.attribute1_value.titlecase
    @features << data.access_value
    @features
  end
end
