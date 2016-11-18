# frozen_string_literal: true
# :nodoc:
# rubocop:disable MethodLength
class StaticPagesController < ApplicationController
  def home
    @storages = [
      {
        address: 'Bronx, NY - 1297 Cromwell Ave',
        coordinates: [55.930385, -3.118425]
      },
      {
        address: 'Bronx, NY - 2325 Hollers Ave',
        coordinates: [40.837048, -73.865433]
      },
      {
        address: 'Center of NY',
        coordinates: [40.730610, -73.935242]
      },
      {
        address: 'Arkansas',
        coordinates: [34.746383, -92.243234]
      }
    ]
  end

  def storage_solutions
  end
end
