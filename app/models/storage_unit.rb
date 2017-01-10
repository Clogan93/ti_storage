# frozen_string_literal: true
# StorageUnit

# columns:
# rent_rate: is the discounted rate,
# push_rate: is the higher rate or offline rate

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

  # copied from #size_class in application_helper,
  # because we need it in react components
  # TODO may to use this method everywhere
  def size_in_text
    case square_feet.to_i
    when 0        then :custom
    when 0..50    then :small
    when 51..150  then :medium
    when 151..300 then :large
    else               :'x-large'
    end
  end

  def serializable_hash(options = {})
    options = {
      methods: [
        :dimensions,
        :size_in_text,
        :features
      ]
    }
    super(options)
  end
end
