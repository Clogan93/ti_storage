# frozen_string_literal: true
# :nodoc:
class AreaPresenter < BasePresenter
  def path
    "/#{slug}"
  end

  def sites
    @model.sites.map { |site| SitePresenter.new(site, h) }
  end
end
