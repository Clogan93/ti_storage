# frozen_string_literal: true
# :nodoc:
class Cart < ApplicationRecord
  store_accessor :data,
    :site_id, :insurance_option_id,
    :reservation_type, :move_in_date, :coupon_code,
    :account_params, :address_params, :phone_params, :payment_params,
    :unit_with_promo_data, :insurance_provider_data,
    :account_data, :payment_data

  def site
    @site ||= Site::LOOKUP[site_id]
  end

  def unit
    return nil if unit_with_promo_data.blank?
    @unit ||= UnitWithPromo.from_centershift(unit_with_promo_data)
  end

  def account
    return nil if account_data.blank?
    @account ||= Account.from_centershift(JSON.parse(account_data))
  end

  def payment
    return nil if payment_data.blank?
    @payment ||= Payment.from_centershift(JSON.parse(payment_data))
  end

  def insurance_provider
    return nil if insurance_provider_data.blank?
    @insurance_provider ||= InsuranceProvider.from_centershift(insurance_provider_data)
  end

  def address_id
    account.address.id.to_i
  rescue
    nil
  end

  def phone_id
    account.phone.id.to_i
  rescue
    nil
  end

  def process_account!
    params = {
      "OrgID" => Organization.id,
      "SiteID" => site_id,
      "FirstName" => account_params.fetch("first_name"),
      "LastName" => account_params.fetch("last_name"),
      "AccountClass" => "PERSONAL",
      "ContactType" => "ACCOUNT_MANAGER",
      "Email" => account_params.fetch("email"),
      "ContactAddress" => [
        "ContactAddress" => {
          # "AddrId" => address_id,
          "AddrType" => "HOME",
          "Addr1" => address_params.fetch("address_1"),
          "Addr2" => address_params.fetch("address_2"),
          "Addr3" => address_params.fetch("address_3", nil),
          "City" => address_params.fetch("city"),
          "State" => address_params.fetch("state"),
          "PostalCode" => address_params.fetch("postal_code"),
          "Country" => address_params.fetch("country", "US"),
          "Active" => true
        }
      ],
      "ContactPhone" => [
        "ACCT_CONTACT_PHONES" => {
          # "PHONE_ID" => phone_id,
          "PHONE_TYPE" => 1,
          "PHONE" => phone_params.fetch("number"),
          "ACTIVE" => true
        }
      ]
    }
    @account = Account.from_centershift(Centershift::Api.create_new_account(params))
    update_account!
  end

  def update_account!
    update_attribute(:account_data, @account.to_json)
  end

  def process_reservation!
    params = {
      "SiteID" => site.id,
      "AcctID" => account.id,
      "UnitID" => unit.id,
      "QuoteID" => quote_id,
      "Version" => unit.version,
      "QuoteType" => quote_type,
      "RentNow" => rent_now,
      "Price" => price,
      "Contacts" => [
        "RentalContact" => {
          "ContactId" => account.contact_id,
          "AddressId" => address_id,
          "PhoneId" => phone_id,
          "PrimaryFlag" => true
        }
      ]
    }
  end

  def process_payment!
    params = {

    }
    @payment = Payment.from_centershift(Centershift::Api)
  end
end
