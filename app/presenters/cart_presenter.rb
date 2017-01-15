# frozen_string_literal: true
# :nodoc:
class CartPresenter < BasePresenter
  def unit
    @unit ||= UnitPresenter.new(@model.unit, h)
  end

  def site
    @site ||= SitePresenter.new(@model.site, h)
  end
end
