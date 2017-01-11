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
      puts "Syncing #{storage.title} site"
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

    def attributes
      {
        version: :to_i,
        rent_rate: :to_f, push_rate: :to_f,
        width: :to_i, depth: :to_i, height: :to_i,
        square_feet: :to_f,
        total_units_in_available_status: :to_i
      }
    end

    def call
      Centershift::Unit.where(site_id: @site_id).each do |unit|
        su = StorageUnit.find_or_initialize_by(
          unit_id: unit.unit_id,
          site_id: unit.site_id
        )
        su = set_attributes_from_centershift(su, unit)
        su.data = unit.to_json
        su.save
      end
    end

    def set_attributes_from_centershift(storage_unit, unit)
      attributes.each_pair do |attribute, converter|
        storage_unit.write_attribute(
          attribute, unit.send(attribute).send(converter)
        )
      end
      storage_unit
    end
  end
end
