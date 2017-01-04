# frozen_string_literal: true
# emails that will be send to the site owners
class AdminMailer < ApplicationMailer
  def sign_up_for_emails_email(name, email)
    mail(
      to: ['reservations@tistorage', 'sales@tistorage.com'],
      subject: 'User wants to sign up for discount emails'
    ) do |format|
      format.text { render plain: "name: #{name}, email: #{email}" }
    end
  end
end
