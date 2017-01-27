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
        create_new_account: [],
        make_reservation: [],
        get_assessments: [:details, :soa_get_assessments],
        get_total_due: [:details],
        add_insurance: [],
        get_unit_data: [:details, :appl_rental_objects_detail],
        make_payment: []
      }
    end

    def self.response_path(method_name)
      ["#{method_name}_response", "#{method_name}_result"].map(&:to_sym) | diggings[method_name]
    end

    def self.method_missing(method_name, *args, &block)
      if diggings.keys.include?(method_name)
        puts ">>>>>>> Centershift::Api action: #{method_name}, request: #{args[0]}"
        response = client.call(action: method_name, request: args[0]).body.dig(*response_path(method_name))
        response
      else
        super
      end
    end

    def self.client
      Rails.env.production? ? Client.instance : FakeClient.instance
      # Client.instance
    end

    def respond_to_missing?(*_)
      true
    end
  end
end
