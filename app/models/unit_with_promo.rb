# frozen_string_literal: true
# :nodoc:
class UnitWithPromo < Unit
  def self.find(id:, site_id:)
    params = {
      "SiteID" => site_id,
      "UnitIDs" => [{ "UnitID" => id }],
      "Status" => [{ "StatusItem" => "Available" }],
      "PromoDataType" => "HighestPriorityDiscountAndPromo"
    }
    from_centershift(api.get_unit_data_with_promos(params).merge({ site_id: site_id}))
  end

  def available?
    total_available.to_i.positive?
  end

  def promotion
    return nil if deepest_discount && deepest_discount.blank?
    @promotion ||= Promotion.from_centershift(deepest_discount.dig(:pcd, :pcd))
  end

  def method_name

  end
end
