# frozen_string_literal: true
module CentershiftSynchronizer
  # Synchronizes Centershift Sites
  class Sites
    def call
      Centershift::Site.all.each do |site|
        Site.new(site: site).call
      end
    end
  end

  # Synchronizes Centershift Site
  class Site
    def initialize(attributes)
      @site = attributes[:site]
      @site_id = attributes[:site_id]
    end

    def call
      storage = Storage.where(site_id: site.site_id).first
      puts "Syncing #{storage.title}"
      storage.update_attribute(:data, site.to_json)
    end

    private

    def site
      @site ||= Centershift::Site.find(@site_id)
    end
  end

  # Synchronizes Centershift Units
  class Units
    def initialize(site_id:)
      @site_id = site_id
    end

    def call
      Centershift::Unit.where(site_id: @site_id).each do |unit|
        storage_unit = StorageUnit.find_or_initialize_by(
          unit_id: unit.attributes[:unit_id],
          site_id: unit.attributes[:site_id]
        )
        storage_unit.update_attribute(:data, unit.to_json)
      end
    end
  end
end
