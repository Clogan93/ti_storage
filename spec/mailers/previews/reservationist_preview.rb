# frozen_string_literal: true
# Preview all emails at http://localhost:3000/rails/mailers/reservationist
class ReservationistPreview < ActionMailer::Preview
  def reservation_confirmation
    ReservationistMailer.reservation_confirmation(reservation)
  end

  def reservation_alert
    ReservationistMailer.reservation_alert(reservation)
  end

  private

  def reservation
    @reservation ||= OpenStruct.new(
      email: "demo@example.com",
      name: "John Doe",
      move_in_date: 7.days.from_now.to_date,
      account: account,
      storage: storage,
      storage_unit: storage_unit
    )
  end

  def account
    @account ||= OpenStruct.new(
      name: "Tom Murphy",
      email: "tom@gmail.com",
      address: address,
      phone: phone
    )
  end

  def storage
    @storage ||= Storage.first
  end

  def storage_unit
    @storage_unit ||= storage.storage_units.last
  end

  def address
    @address ||= OpenStruct.new(
      address_1: "123 4th St.",
      city: "Brooklyn",
      state: "NY",
      postal_code: "12345"
    )
  end

  def phone
    @phone ||= OpenStruct.new(
      phone: "7181231234"
    )
  end
end
