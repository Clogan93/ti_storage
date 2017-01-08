# frozen_string_literal: true
# emails that will be send to the site owners
class AdminMailer < ApplicationMailer
  def sign_up_for_emails_email(name, email)
    mail(
      to: mail_to(['reservations@tistorage', 'sales@tistorage.com']),
      subject: 'User has signed up to receive discounts'
    ) do |format|
      format.text do
        render plain: "#{name}, #{email} has signed up to receive discounts."
      end
    end
  end

  def new_customer_contacts_us_email(data)
    @data = data
    mail(
      to: mail_to(['reservations@tistroage.com', 'sales@tistroage.com']),
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

  # used for staging and development
  def mail_to(default)
    ENV['SEND_EMAILS_TO'] ? ENV['SEND_EMAILS_TO'] : default
  end
end
