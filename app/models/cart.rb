# frozen_string_literal: true
# :nodoc:
class Cart < ApplicationRecord
  store_accessor :data,
    :site_id, :insurance_option_id,
    :reservation_type, :move_in_date, :coupon_code, :need_help_moving,
    :account_params, :address_params, :phone_params, :payment_params,
    :assessments_data, :total_due_data,
    :unit_data, :account_data, :reservation_data, :payment_data,
    :unit_with_promo_data, :insurance_provider_data,

  def site
    @site ||= Site::LOOKUP[site_id]
  end

  def unit
    @unit ||= unit_data.blank? ? nil : Unit.from_centershift(unit_data)
  end

  def unit_with_promo
    @unit_with_promo ||= UnitWithPromo.find(id: unit_id, site_id: site.id)
  end

  def account
    @account ||= account_data.blank? ? nil : Account.from_centershift(JSON.parse(account_data).merge({ params: account_params }))
  end

  def payment
    @payment ||= payment_data.blank? ? nil : Payment.from_centershift(JSON.parse(payment_data))
  end

  def insurance_provider
    @insurance_provider ||= insurance_provider_data.blank? ? nil : InsuranceProvider.from_centershift(insurance_provider_data)
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

  def account_request
    {
      "OrgID" => Organization.id,
      "SiteID" => site.id,
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
  end

  def process_account!
    puts ">>>>>>> process_account! - #{account_request}"
    @account = Account.from_centershift(Centershift::Api.create_new_account(account_request))
    update_account!
  end

  def update_account!
    update_attribute(:account_data, @account.to_json)
  end

  def quote_type
    case reservation_type
    when "rent" then "QuoteOnly"
    else
      "HardReservation"
    end
  end

  def rent_now
    case quote_type
    when "QuoteOnly" then true
    else
      false
    end
  end

  def reservation
    @reservation ||= reservation_data.blank? ? nil : Reservation.from_centershift(JSON.parse(reservation_data))
  end

  def reset_reservation
    @reservation = reservation_data = nil
  end

  def reservation_request
    {
      "SiteID" => site.id,
      "AcctID" => account.id,
      "UnitID" => unit_with_promo.id,
      "Version" => unit_with_promo.version.to_f,
      "QuoteID" => reservation && reservation.id,
      "QuoteType" => quote_type,
      "RentNow" => rent_now,
      "Price" => unit_with_promo.street_rate.to_f,
      "Contacts" => [
        "RentalContact" => {
          "ContactId" => account.contact_id.to_i,
          "AddressId" => address_id,
          "PhoneId" => phone_id,
          "PrimaryFlag" => true
        }
      ],
      "Pcds" => [
        "TRAN_QUOTE_PCD_DETAIL" => {
          "PCD_ID" => unit_with_promo.promotion.id
        }
      ]
    }
  end

  def process_reservation!
    puts ">>>>>>> process_reservation! - #{reservation_request}"
    @reservation = Account.from_centershift(Centershift::Api.make_reservation(reservation_request))
    update_reservation!
  end

  def update_reservation!
    update_attribute(:reservation_data, @reservation.to_json)
  end

  def process_insurance!
    params = {
      "OrgID" => Organization.id,
      "SiteID" => site.id,
      "AcctID" => account.id,
      "RentalID" => reservation.rental_id.to_i,
      "InsuranceOptionID" => insurance_provider.id,
    }
    puts ">>>>>>> process_insurance! - #{params}"
    Insurance.from_centershift(
      Centershift::Api.add_insurance(params)
    )
  end

  def process_assessments!
    puts ">>>>>>> process_assessments!"
    @assessments ||= Assessment.where(site_id: site.id, account_id: account.id).all
    update_assessments!
  end

  def update_assessments!
    update_attribute(:assessments_data, @assessments.to_json)
  end

  def assessments
    @assessments ||= assessments_data.blank? ? nil : JSON.parse(assessments_data).map { |ass| Assessment.from_centershift(ass) }
  end

  def process_total_due!
    puts ">>>>>>> process_total_due!"
    @total_due ||= TotalDue.where(site_id: site.id, account_id: account.id)
    update_total_due!
  end

  def update_total_due!
    update_attribute(:total_due_data, @total_due.to_json)
  end

  def total_due
    @total_due ||= total_due_data.blank? ? nil : TotalDue.from_centershift(JSON.parse(total_due_data))
  end

  def process_payment!
    params = {
      "SiteID" => site.id,
      "AcctID" => account.id,
      "TotalAmtDue" => total_due.amount,
      "TotalAmtPaid" => total_due.amount,
      "CreditCardInfo" => Payment.credit_card_info_attributes(payment_params.deep_symbolize_keys!.merge({ total_amount_paid: total_due.amount }))
    }
    puts ">>>>>>> process_payment! - #{params}"
    @payment = Payment.from_centershift(Centershift::Api.make_payment(params))
    update_payment!
  end

  def update_payment!
    update_attribute(:payment_data, @payment.to_json)
  end

  def send_notifications
    CartMailer.cart_confirmation(self).deliver_later
    CartMailer.cart_alert(self).deliver_later
  end

  def complete?
    payment.try(:id).present?
  end
end
