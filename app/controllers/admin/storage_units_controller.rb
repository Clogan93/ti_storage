# frozen_string_literal: true
module Admin
  # StoragesController
  class StorageUnitsController < AdminController
    def index
      @storage_units = storage.storage_units
    end

    def show
      @storage_unit = storage.storage_units.find(params[:id])
    end

    def sync
      CentershiftSynchronizer::Units.new(site_id: storage.site_id).call
      redirect_to([:admin, storage, :storage_units])
    end

    private

    def storage
      @storage ||= Storage.find(params[:storage_id])
    end
  end
end
