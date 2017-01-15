# frozen_string_literal: true
class SitesController < ApplicationController
  def index
    @sites = all_sites
  end

  def show
    area = Area.send(params.fetch(:area_id))
    @area = AreaPresenter.new(area, view_context)

    site = Site.find(params.fetch(:id).to_sym)
    @site = SitePresenter.new(site, view_context)
  end
end
