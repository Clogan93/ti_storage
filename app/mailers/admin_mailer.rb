# frozen_string_literal: true
# emails that will be send to the site owners
class AdminMailer < ApplicationMailer
  layout 'admin_mailer'
  default from: 'reservations@tistorage.com'

  def new_subscription(subscription)
    @subscription = subscription

    mail(
      to: mail_to(subscription.to),
      bcc: ["chase@marketmymarket.com", "omar@marketmymarket.com"],
      subject: 'User has signed up to receive discounts'
    )
  end

  def new_contact(contact)
    @contact = contact

    mail(
      to: mail_to(contact.to),
      bcc: ["chase@marketmymarket.com", "omar@marketmymarket.com"],
      subject: contact.subject
    )
  end

  def sign_up_for_emails_email(name, email)
    content = "#{name}, #{email} has signed up to receive discounts."

    mail(
      to: mail_to(['reservations@tistorage.com', 'sales@tistorage.com']),
      subject: 'User has signed up to receive discounts'
    ) do |format|
      format.text do
        render plain: content
      end
    end
  end

  def new_customer_contacts_us_email(data)
    @data = data
    mail(
      to: mail_to(['reservations@tistorage.com', 'sales@tistorage.com']),
      subject: 'New customer wants to contact you'
    )
  end

  def old_customer_contacts_us_email(data)
    @data = data
    mail(
      to: mail_to(['gt@ceqy.com']),
      subject: 'Old customer wants to contact you'
    )
  end

  private

  def mail_to(default)
    if Rails.env.production?
      default
    else
      ENV['SEND_EMAILS_TO'].present? ? ENV['SEND_EMAILS_TO'].split(',') : default
    end
  end
end
