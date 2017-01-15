# frozen_string_literal: true
# :nodoc:
class UnitPresenter < BasePresenter
  def reserve_path
    h.url_for([@model.site, @model, :reserve])
  end

  def site
    @site ||= SitePresenter.new(@model.site, h)
  end

  def as_json(_options = {})
    {
      id: id,
      push_rate: push_rate,
      rent_rate: rent_rate,
      dimensions: dimensions,
      size: size,
      promotion: {
        description: promotion && promotion.description
      },
      reserve_path: reserve_path
    }.as_json
  end
end
