# frozen_string_literal: true
# :nodoc:
class CartPresenter < BasePresenter
  def unit
    @unit ||= UnitPresenter.new(@model.unit, h)
  end

  def site
    @site ||= SitePresenter.new(@model.site, h)
  end

  def insurance_provider_options
    @insurance_provider_options ||= @model.site.insurance_providers.all.collect { |p| [ p.description, p.id ] }
  end

  def insurance_provider
    @insurance_provider ||= InsuranceProviderPresenter.new((@model.insurance_provider || @model.site.default_insurance_provider), h)
  end
end
