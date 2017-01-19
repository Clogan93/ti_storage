# frozen_string_literal: true
# :nodoc:
class Unit < CentershiftModel
  def self.where(attributes)
    action = lambda do
      params = {
        "SiteID" => attributes.fetch(:site_id),
        "PromoDataType" => "HighestPriorityDiscountAndPromo"
      }
      api.get_site_unit_data_v2(params).map do |unit|
        from_centershift(unit)
      end
    end
    Relations.new(&action)
  end

  def self.find(id:, site_id:)
    params = {
      "SiteID" => site_id,
      "UnitID" => id
    }
    from_centershift(api.get_unit_data(params))
  end

  def id
    unit_id.to_i
  end

  def dimensions
    @dimensions ||= [
      width, depth, (height if height.to_i.positive?)
    ].compact.join("x")
  end

  def features
    @features ||= [
      (climate_value.titlecase if respond_to?(:climate_value)),
      (attribute1_value.titlecase if respond_to?(:attribute1_value)),
      (attribute2_value.titlecase if respond_to?(:attribute2_value)),
      (access_value.titlecase if respond_to?(:access_value))
    ].compact.map(&:strip)
  end

  def promotion
    return nil if promo_collection.blank?
    @promotion ||= Promotion.from_centershift(promo_collection[:appl_best_pcd])
  end

  def size
    @size ||= case square_feet.to_i
              when 0 then :custom
              when 1..50 then :small
              when 51..150 then :medium
              when 151..300 then :large
              else
                :'x-large'
              end
  end

  def available?
    total_units_available.to_i.positive?
  end

  def site
    @site ||= Site::LOOKUP[site_id.to_i]
  end
end
