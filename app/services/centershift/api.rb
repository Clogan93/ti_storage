# frozen_string_literal: true
module Centershift
  # Centershift Api
  class Api
    def self.diggings
      {
        get_org_list: [:details, :organization],
        get_site_list: [:details, :soa_get_site_list],
        get_site_details: [:details, :soa_site_attributes],
        get_site_unit_data: [:details, :site_unit_data],
        get_site_unit_data_v2: [:units, :unit],
        get_unit_data_with_promos: [:units, :unit],
        get_insurance_providers: [:details, :org_ins_site_offerings],
        create_new_account: []
      }
    end

    def self.response_path(method_name)
      ["#{method_name}_response", "#{method_name}_result"].map(&:to_sym) | diggings[method_name]
    end

    def self.method_missing(method_name, *args, &block)
      if diggings.keys.include?(method_name)
        client.call(action: method_name, request: args[0]).body.dig(*response_path(method_name))
      else
        super
      end
    end

    def self.client
      # @@client ||= Rails.env.production? ? Client.instance : FakeClient.instance
      @@client ||= Client.instance
    end

    def respond_to_missing?(*_)
      true
    end
  end
end
