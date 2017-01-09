# frozen_string_literal: true
module Admin
  # StoragesController
  class StoragesController < AdminController
    def index
      @storages = Storage.all
    end

    def show
      @storage = Storage.find(params[:id])
    end

    def edit
      @storage = Storage.find(params[:id])
    end

    def update
      @storage = Storage.find(params[:id])
      if @storage.update_attributes(storage_params)
        redirect_to([:admin, @storage])
      else
        render :edit
      end
    end

    def sync
      CentershiftSynchronizer::Sites.new.call
      redirect_to([:admin, :storages])
    end

    private

    def storage_params
      params.require(:storage).permit(
        :place_id, :link_to_google, :link_to_yelp,
        :features, :coordinates, :description_1, :description_2, :directions
      )
    end
  end
end
