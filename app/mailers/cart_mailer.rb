# frozen_string_literal: true
# :nodoc:
class CartMailer < ApplicationMailer
  default from: 'reservations@tistorage.com'

  def cart_confirmation(cart)
    @cart = CartPresenter.new(cart, ActionView::Base.new)
    mail(
      to: mail_to(email_with_name(cart.account.email, cart.account.name)),
      bcc: ["chase@marketmymarket.com", "omar@marketmymarket.com"],
      subject: "Treasure Island Storage Reservation"
    )
  end

  def cart_alert(cart)
    @cart = CartPresenter.new(cart, ActionView::Base.new)
    mail(
      to: mail_to("carts@tistorage.com"),
      cc: mail_to(email_list(cart)),
      bcc: ["chase@marketmymarket.com", "omar@marketmymarket.com"],
      subject: "Website Reservation"
    )
  end

  private

  def email_with_name(email, name)
    %("#{name}" <#{email}>)
  end

  def mail_to(default)
    if Rails.env.production?
      default
    else
      ENV['SEND_EMAILS_TO'].present? ? ENV['SEND_EMAILS_TO'].split(',') : default
    end
  end

  def email_list(cart)
    [
      cart.site.email,
      "jcoakley@ceqy.com",
      "gt@ceqy.com"
    ]
  end
end
