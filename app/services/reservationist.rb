# frozen_string_literal: true
module Reservationist
  # Reserve
  class Reserve
    def initialize(attributes)
      @storage_unit = attributes.fetch(:storage_unit)
      @account = attributes.fetch(:account)
      @account_params = attributes.fetch(:account_params)
      @reservation = attributes.fetch(:reservation)
      @reservation_params = attributes.fetch(:reservation_params)
      @address_params = attributes.fetch(:address_params)
      @phone_params = attributes.fetch(:phone_params)
    end

    def call
      if reservation
        update_reservation
      else
        create_reservation
      end
      self
    end

    attr_reader :reservation

    def account
      @account ||= create_account
    end

    private

    attr_reader :storage_unit,
      :account_params, :reservation_params, :address_params, :phone_params

    def create_account
      a = Centershift::Account.create(
        site_id: storage.site_id,
        first_name: account_params.fetch(:first_name),
        last_name: account_params.fetch(:last_name),
        email: account_params.fetch(:email)
      )
      @account = Account.create(
        account_params.merge(account_id: a.account_id, contact_id: a.contact_id)
      )
    end

    def address
      @address ||= account.addresses.last || create_address
    end

    def create_address
      address = Centershift::Address.create(c_address_attributes)
      @address = Address.create(
        address_id: address.address_id, contact_id: address.contact_id,
        data: address.to_json
      )
    end

    def c_address_attributes
      { contact_id: account.contact_id,
        address_1: address_params.fetch(:address_1),
        address_2: address_params.fetch(:address_2),
        city: address_params.fetch(:city), state: address_params.fetch(:state),
        postal_code: address_params.fetch(:postal_code),
        country: address_params.fetch(:country, 'US') }
    end

    def phone
      @phone ||= account.phones.last || create_phone
    end

    def create_phone
      phone = Centershift::Phone.create(
        contact_id: account.contact_id, phone: phone_params.fetch(:phone)
      )
      @phone = Phone.create(
        phone_id: phone.phone_id, contact_id: phone.contact_id,
        data: phone.to_json
      )
    end

    def create_reservation
      r = Centershift::Reservation.create(c_reservation_attributes)
      @reservation = Reservation.create(reservation_attributes(r))
    end

    def update_reservation
      r = Centershift::Reservation.create(c_reservation_attributes)
      reservation.update_attributes(reservation_attributes(r))
    end

    def c_reservation_attributes
      { site_id: storage.site_id, account_id: account.account_id,
        quote_id: reservation && reservation.quote_id || nil }
        .merge(contact_attributes)
        .merge(storage_unit_attributes)
    end

    def storage_unit_attributes
      { unit_id: storage_unit.unit_id, version: storage_unit.version,
        price: storage_unit.rent_rate }
    end

    def contact_attributes
      { contact_id: account.contact_id, address_id: address.address_id,
        phone_id: phone.phone_id }
    end

    def reservation_attributes(r)
      reservation_params
        .merge(
          site_id: storage.site_id, account_id: account.account_id,
          quote_id: r.quote_id, rental_id: r.rental_id
        ).merge(storage_unit_attributes)
    end

    def storage
      storage_unit.storage
    end

    def storage_unit
      @storage_unit ||= StorageUnit.where(unit_id: params.fetch(:unit_id)).first
    end
  end

  # Pay
  class Pay
    def initialize(attributes)
      @reservation = attributes.fetch(:reservation)
      @payment_params = attributes.fetch(:payment_params)
    end

    def call
      payment
    end

    attr_reader :reservation, :payment_params

    def send_emails
      ReservationistMailer.reservation_confirmation(reservation).deliver_now
      ReservationistMailer.reservation_alert(reservation).deliver_now
    end

    def payment
      reservation.payment || create_payment
    end

    def assessments
      @assessments ||= Centershit::Assessment.find(
        site_id: reservation.site_id,
        account_id: reservation.account_id
      )
    end

    def total_due
      @total_due ||= Centershift::TotalDue.find(
        site_id: reservation.site_id,
        account_id: reservation.account_id
      )
    end

    def create_payment
      payment = Centershift::Payment.create(create_payment_attributes)
      @payment = reservation.create_payment(
        reservation_id: reservation.id, transaction_id: payment.tran_id,
        data: payment_params.merge(payment.attributes)
      )
      send_emails
    end

    def create_payment_attributes
      {
        site_id: reservation.site_id, account_id: reservation.account_id,
        total_amount_due: total_due.amount, total_amount_paid: total_due.amount
      }.merge(payment_attributes)
    end

    def payment_attributes
      {
        card_number: payment_params.fetch(:card_number),
        card_holder_name: payment_params.fetch(:card_holder_name),
        expire_month: payment_params.fetch(:expire_month),
        expire_year: payment_params.fetch(:expire_year),
        cvv2: payment_params.fetch(:cvv2),
        address: payment_params.fetch(:address, nil),
        postal_code: payment_params.fetch(:postal_code)
      }
    end
  end
end
