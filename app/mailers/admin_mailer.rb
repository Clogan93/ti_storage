# frozen_string_literal: true
# emails that will be send to the site owners
class AdminMailer < ApplicationMailer
  default to: 'chase@marketmymymarket.com'
  # ['reservations@tistorage', 'sales@tistorage.com'],

  def sign_up_for_emails_email(name, email)
    content = "#{name}, #{email} has signed up to receive discounts."

    mail(
      subject: 'User has signed up to receive discounts'
    ) do |format|
      format.text { render plain: content }
    end
  end
end
