# frozen_string_literal: true
# :nodoc:
module Centershift
  class FakeClient
    include Singleton

    FIXTURES = YAML.load(ERB.new(File.read("#{Rails.root}/app/services/centershift/fixtures.yml")).result).deep_symbolize_keys!

    def call(action:, request:)
      OpenStruct.new(body: send(action))
    end

    def get_org_list
      FIXTURES[:get_org_list]
    end

    def get_site_list
      FIXTURES[:get_site_list]
    end

    def get_site_details
      FIXTURES[:get_site_details]
    end

    def get_site_unit_data
      FIXTURES[:get_site_unit_data]
    end

    def get_site_unit_data_v2
      FIXTURES[:get_site_unit_data_v2]
    end

    def get_unit_data_with_promos
      FIXTURES[:get_unit_data_with_promos]
    end

    def get_insurance_providers
      FIXTURES[:get_insurance_providers]
    end

    def create_new_account
      FIXTURES[:create_new_account]
    end

    def make_reservation
      FIXTURES[:make_reservation]
    end

    def get_assessments
      FIXTURES[:get_assessments]
    end

    def get_total_due
      FIXTURES[:get_total_due]
    end

    def add_insurance
      FIXTURES[:add_insurance]
    end

    def get_unit_data
      FIXTURES[:get_unit_data]
    end

    def make_payment
      FIXTURES[:make_payment]
    end
  end
end
