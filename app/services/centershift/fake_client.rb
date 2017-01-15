# frozen_string_literal: true
# :nodoc:
module Centershift
  class FakeClient
    include Singleton

    def call(action:, request:)
      OpenStruct.new(body: send(action))
    end

    def get_org_list
      {
        get_org_list_response: {
          get_org_list_result: {
            details: {
              organization: {
                org_id: "5122",
                org_name: "Treasure Island Storage",
                address_line1: "1350 Broadway, Suite 1010",
                city: "New York",
                state: "NY",
                postal_code: "10018",
                country: "USA",
                app_display_name: "Treasure Island Storage",
                email: "jcoakley@klcny.com",
                primary: true
              }
            }
          }
        }
      }
    end

    def get_site_list
      {
        get_site_list_response: {
          get_site_list_result: {
            details: {
              soa_get_site_list: [
                soa_get_site_list_item,
                soa_get_site_list_item
              ]
            }
          }
        }
      }
    end

    def soa_get_site_list_item
      {
        site_id: "702357",
        org_id: "5122",
        affiliate_id: "1000000462",
        site_name: "Treasure Island - Jamaica",
        site_number: "Jamaica",
        property_type: "1",
        timezone_offset: "1",
        timezone_disp_offset: "2",
        current_time: "11:20 PM",
        parent_site: nil,
        email_address: "Jamaica@TIStorage.com",
        phone: "7187753800",
        fax: "7182061829",
        address_label: "Seed Address",
        line1: "109-09 180th Street",
        city: "Jamaica",
        state: "NY",
        postal_code: "11433",
        country: "USA",
        site_stauts: "2",
        online_status: "1",
        display_name: "Treasure Island - Jamaica"
      }
    end

    def get_site_details
      {
        get_site_details_response: {
          get_site_details_result: {
            details: {
              soa_site_attributes: {
                site_id: "702352",
                site_name: "Treasure Island - Woodbridge",
                site_number: "Woodbridge",
                gate_type_id: "1000000914",
                dir_north: nil,
                dir_south: nil,
                dir_east: nil,
                dir_west: nil,
                gate_hours: "Closed",
                facility_built: DateTime.current,
                golive: nil,
                parent_site: nil,
                email_address: "Woodbridge@TIStorage.com",
                phone: "732.734.0381",
                cflex03: "",
                address_label: "Seed Address",
                line1: "881 St. Georges Avenue",
                city: "Woodbridge",
                state: "NJ",
                postal_code: "07095",
                country: "USA",
                property_type: "1",
                timezone_offset: "1",
                app_status: "2",
                app_status_val: "Active",
                display_name: "Treasure Island - Woodbridge"
              }
            }
          }
        }
      }
    end

    def get_site_unit_data
      {
        get_site_unit_data_response: {
          get_site_unit_data_result: {
            details: {
              site_unit_data: [
                site_unit_data_item
              ]
            }
          }
        }
      }
    end

    def site_unit_data_item
      {
        unit_number: "C1542",
        unit_id: "3810624",
        version: "34",
        promo_id: nil,
        soft_reservation: "Y",
        hard_reservation: "Y",
        res_amount: "10",
        class_desc: "Storage Rentals",
        obj_period_uom_val: "Months",
        min_rent_rate: "119",
        max_rent_rate: "154",
        quantity: "37",
        available: "4",
        site_class_id: "1000013001",
        depth: "10",
        width: "8",
        site_id: "702352",
        features_val: "Climate-Control ,Interior",
        current_rate: "119",
        push_rate: "137",
        attribute01: "100051"
      }
    end
  end
end
