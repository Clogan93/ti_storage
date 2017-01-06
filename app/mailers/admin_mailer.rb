# frozen_string_literal: true
# emails that will be send to the site owners
class AdminMailer < ApplicationMailer
  def sign_up_for_emails_email(name, email)
    mail(
      to: 'chase@marketmymymarket.com',
      # ['reservations@tistorage', 'sales@tistorage.com'],
      subject: 'User has signed up to receive discounts'
    ) do |format|
      format.text do
        render plain: "#{name}, #{email} has signed up to receive discounts."
      end
    end
  end
end
