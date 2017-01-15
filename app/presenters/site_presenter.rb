# frozen_string_literal: true
# :nodoc:
class SitePresenter < BasePresenter
  def title
    site_number
  end

  def image_path
    "_db/storages/#{slug}.jpg"
  end

  def address_1
    line1
  end

  def city_state_and_zip
    "#{city}, #{state} #{postal_code}"
  end

  def grouped_units
    punits = units.map { |unit| UnitPresenter.new(unit, h) }
    groups = {}
    punits.each do |unit|
      sizing = unit.size
      groups[sizing] ||= []
      groups[sizing] << unit
    end
    groups.keys.each do |sizing|
      groups[sizing] = groups[sizing].sort_by { |unit| unit.rent_rate.to_i }
    end
    @grouped_units = groups
  end

  def all_units
    order = [:small, :medium, :large, :'x-large', :custom]
    @all_units ||= order.map { |size| grouped_units[size] }.flatten.compact
  end

  def cheapest_units
    grouped_units[:small].take(3)
  end

  def url
    [nil, area.slug, slug].join("/")
  end

  def as_json(_options = nil)
    {
      id: id,
      title: title,
      url: url,
      address_1: address_1,
      city: city,
      state: state,
      postal_code: postal_code,
      city_state_and_zip: city_state_and_zip,
      coordinates: coordinates,
      cheapest_units: cheapest_units,
      image_path: h.image_path(image_path)
    }.as_json
  end
end
