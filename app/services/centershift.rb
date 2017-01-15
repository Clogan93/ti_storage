# frozen_string_literal: true
module Centershift
  # Centershift Common
  class Common
    def initialize(attributes)
      @attributes = attributes
    end

    attr_reader :attributes

    def to_json
      @attributes.to_json
    end

    def method_missing(method_name, *args, &block)
      if attributes.keys.include?(method_name)
        attributes[method_name]
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      attributes.keys.include?(method_name) || super
    end

    def respond_to_missing?(*_)
      true
    end
  end

  class Organization
    ID = 5122
  end

  # Centershift Site
  class Site < Common
    def self.all
      r = Api.instance.get_site_list("OrgID" => 5122)
      h = r.body[:get_site_list_response][:get_site_list_result][:details]
      h[:soa_get_site_list].map do |attributes|
        find(attributes.fetch(:site_id))
      end
    end

    def self.find(site_id)
      request = { "SiteID" => [{ "long" => site_id }] }
      r = Api.instance.get_site_details(request)
      h = r.body[:get_site_details_response][:get_site_details_result]
      new(h[:details][:soa_site_attributes])
    end

    def site_id
      @attributes.fetch(:site_id)
    end
  end

  # Centershift Unit
  class Unit < Common
    def self.where(site_id:)
      r = Api.instance.get_site_unit_data_v3(
        "SiteID" => site_id,
        "GetPromoData" => true
      )
      h = r.body[:get_site_unit_data_v3_response][:get_site_unit_data_v3_result]
      h[:unit_type_status].map { |attributes| new(attributes) }
    end
  end

  # Centershift Account
  class Account < Common
    def self.find(contact_id, account_id)
      r = Api.instance.get_account_info(
        "ContactID" => contact_id, "AcctID" => account_id
      )
      h = r.body[:get_account_info_response][:get_account_info_result]
      new(h[:details][:soa_act_info])
    end

    def self.create(attributes)
      r = Api.instance.create_new_account(request_from_attributes(attributes))
      new(r.body[:create_new_account_response][:create_new_account_result])
    end

    def addresses
      r = Api.instance.get_contact_addresses(
        "ContactID" => contact_id, "AcctID" => account_id
      )
      h = r.body[:get_contact_addresses_response][:get_contact_addresses_result]
      Address.new(h[:details])
    end

    def phones
      r = Api.instance.get_contact_phone_numbers(
        "ContactID" => contact_id, "AcctID" => acct_id
      )
      h = r.body[:get_contact_phone_numbers_response]
      Address.new(h[:get_contact_phone_numbers_result][:details])
    end

    def account_id
      attributes[:account_id] || attributes[:acct_id]
    end

    def self.request_from_attributes(attributes)
      {
        "OrgID" => 5122,
        "SiteID" => attributes.fetch(:site_id),
        "FirstName" => attributes.fetch(:first_name),
        "LastName" => attributes.fetch(:last_name),
        "Email" => attributes.fetch(:email),
        "AccountClass" => "PERSONAL",
        "ContactType" => "ACCOUNT_MANAGER"
      }
    end
  end

  # Centershift Address
  class Address < Common
    def self.create(attributes)
      r = Api.instance.add_new_address(request_from_attributes(attributes))
      new(r.body[:add_new_address_response][:add_new_address_result][:details])
    end

    def address_id
      addr_id
    end

    def self.request_from_attributes(attributes)
      { "ContactId" => attributes.fetch(:contact_id),
        "AddrType" => "HOME", "Addr1" => attributes.fetch(:address_1),
        "Addr2" => attributes.fetch(:address_2), "Addr3" => "",
        "City" => attributes.fetch(:city), "State" => attributes.fetch(:state),
        "PostalCode" => attributes.fetch(:postal_code),
        "Country" => attributes.fetch(:country), "Active" => true }
    end
  end

  # Centershift Phone
  class Phone < Common
    def self.create(attributes)
      r = Api.instance.add_new_phone(
        "ContactId" => attributes.fetch(:contact_id),
        "PhoneType" => "HOME",
        "Phone" => attributes.fetch(:phone),
        "Active" => true
      )
      new(r.body[:add_new_phone_response][:add_new_phone_result][:details])
    end
  end

  # Centershift Reservation
  class Reservation < Common
    def self.where(params)
      r = Api.instance.get_reservations(
        "OrgID" => params.fetch(:organization_id, 5122),
        "SiteID" => params.fetch(:site_id),
        "AcctID" => params.fetch(:account_id)
      )
      h = r.body[:get_reservations_response][:get_reservations_result][:details]
      new(h[:tran_quotes_detail])
    end

    def self.create(attributes)
      r = Api.instance.make_reservation(request_from_attributes(attributes))
      new(r.body[:make_reservation_response][:make_reservation_result])
    end

    def self.request_from_attributes(attributes)
      { "SiteID" => attributes.fetch(:site_id),
        "AcctID" => attributes.fetch(:account_id),
        "UnitID" => attributes.fetch(:unit_id),
        "QuoteID" => attributes.fetch(:quote_id, nil),
        "Version" => attributes.fetch(:version),
        "QuoteType" => attributes.fetch(:quote_type, "HardReservation"),
        "RentNow" => attributes.fetch(:rent_now, false),
        "Price" => attributes.fetch(:price),
        "Contacts" => contact_attributes(attributes) }
    end

    def self.contact_attributes(attributes)
      [
        "RentalContact" => {
          "ContactId" => attributes.fetch(:contact_id),
          "AddressId" => attributes.fetch(:address_id),
          "PhoneId" => attributes.fetch(:phone_id),
          "PrimaryFlag" => true
        }
      ]
    end
  end

  # Centershift Assessment
  class Assessment < Common
    def self.find(attributes)
      r = Api.instance.get_assessments(
        "SiteID" => attributes.fetch(:site_id),
        "AcctID" => attributes.fetch(:account_id)
      )
      h = r.body[:get_assessments_response][:get_assessments_result][:details]
      new(h[:soa_get_assessments])
    end
  end

  # Centershift TotalDue
  class TotalDue < Common
    def self.find(attributes)
      r = Api.instance.get_total_due(
        "SiteID" => attributes.fetch(:site_id),
        "AcctID" => attributes.fetch(:account_id)
      )
      h = r.body[:get_total_due_response][:get_total_due_result][:details]
      new(amount: h)
    end
  end

  # Centershift Payment
  class Payment < Common
    def self.create(attributes)
      r = Api.instance.make_payment(
        "SiteID" => attributes.fetch(:site_id),
        "AcctID" => attributes.fetch(:account_id),
        "TotalAmtDue" => attributes.fetch(:total_amount_due),
        "TotalAmtPaid" => attributes.fetch(:total_amount_paid),
        "CreditCardInfo" => credit_card_info_attributes(attributes)
      )
      new(r.body[:make_payment_response][:make_payment_result])
    end

    def self.credit_card_info_attributes(attributes)
      {
        "Amount" => attributes.fetch(:total_amount_paid),
        "CardNumber" => attributes.fetch(:card_number),
        "CardHolderName" => attributes.fetch(:card_holder_name),
        "ExpireMonth" => attributes.fetch(:expire_month),
        "ExpireYear" => attributes.fetch(:expire_year),
        "CVV2" => attributes.fetch(:cvv2),
        "Address" => attributes.fetch(:address, nil),
        "PostalCode" => attributes.fetch(:postal_code)
      }
    end
  end
end
