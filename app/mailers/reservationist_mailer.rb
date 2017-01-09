# frozen_string_literal: true
# :nodoc:
class ReservationistMailer < ApplicationMailer
  default from: 'reservations@tistorage.com'

  def reservation_confirmation(reservation)
    @reservation = reservation
    mail(
      to: "reservations@tistorage.com",
      cc: email_with_name(reservation.account.email, reservation.account.name),
      subject: "Treasure Island Storage Reservation"
    )
  end

  def reservation_alert(reservation)
    @reservation = reservation
    mail(
      to: email_list(reservation),
      subject: "Website Reservation"
    )
  end

  def email_with_name(email, name)
    %("#{name}" <#{email}>)
  end

  def email_list(reservation)
    [
      reservation.storage.email,
      "jcoakley@ceqy.com",
      "gt@ceqy.com",
      "chase@marketmymarket.com",
      "omar@marketmymarket.com"
    ]
  end
end
