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
    from_centershift(api.get_unit_data_with_promos(params))
  end

  def available?
    total_available.to_i.positive?
  end
end
