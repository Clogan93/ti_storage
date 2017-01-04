# frozen_string_literal: true
module Centershift
  # Centershift Api
  class Api
    include Singleton

    def method_missing(method_name, *args, &block)
      if Client.instance.can_call?(method_name)
        Client.instance.call(action: method_name, request: args[0])
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      Client.instance.can_call?(method_name) || super
    end

    def respond_to_missing?(*_)
      true
    end
  end

  # Centershift Common
  class Common
    def initialize(attributes)
      @attributes = attributes
    end

    attr_reader :attributes

    def to_json
      @attributes.to_json
    end
  end

  # Centershift Site
  class Site < Common
    def self.all
      r = Api.instance.get_site_list("OrgID" => 5122)
      h = r.body[:get_site_list_response][:get_site_list_result][:details]
      h[:soa_get_site_list].map { |attributes| find(attributes[:site_id]) }
    end

    def self.find(site_id)
      request = { "SiteID" => [{ "long" => site_id }] }
      r = Api.instance.get_site_details(request)
      h = r.body[:get_site_details_response][:get_site_details_result]
      new(h[:details][:soa_site_attributes])
    end

    def site_id
      @attributes[:site_id]
    end
  end

  # Centershift Unit
  class Unit < Common
    def self.where(site_id:)
      r = Api.instance.get_site_unit_data_v3("SiteID" => site_id)
      h = r.body[:get_site_unit_data_v3_response][:get_site_unit_data_v3_result]
      h[:unit_type_status].map { |attributes| new(attributes) }
    end
  end

  # Centershift Client
  class Client
    include Singleton

    WSDL = "https://slc.centershift.com/store40/sws.asmx?WSDL"

    def initialize
      @client = Savon.client(wsdl: WSDL)
      @operations = @client.operations
    end

    def call(action:, request:)
      message = { "Request" => request }.merge(lookup_user)
      @client.call(action, message: message)
    end

    def can_call?(operation)
      @operations.include?(operation)
    end

    private

    def lookup_user
      @lookup_user ||= {
        "LookupUser_Request" => {
          "Username" => "TISMMymarket",
          "Password" => 'i"jV@7FEFB',
          "Channel" => 13
        }
      }
    end
  end
end
