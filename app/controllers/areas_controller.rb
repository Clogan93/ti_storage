# frozen_string_literal: true
class AreasController < ApplicationController
  def show
    area = Area.send(params.fetch(:id))
    @area = AreaPresenter.new(area, view_context)
    @sites = @area.sites
  end
end
