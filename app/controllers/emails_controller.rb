# frozen_string_literal: true
# :nodoc:
class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # ___why rescue block?
  # http://stackoverflow.com/questions/32999581/rails-error-checking-for-email-delivery-deliver-now
  def send_sign_up_for_emails_email
    AdminMailer.sign_up_for_emails_email(
      params[:name], params[:email]
    ).deliver_now
    render nothing: true, status: 200
  rescue => message
    render json: message, status: 500
  end

  def send_contact_email
    if params[:is_current_customer] == 'false'
      AdminMailer.new_customer_contacts_us_email(
        params[:name], params[:email], params[:phone],
        params[:message], params[:where_from_heard_about_us]
      ).deliver_now
    else
      AdminMailer.old_customer_contacts_us_email(
        params[:name], params[:email], params[:phone],
        params[:message], params[:storage_used]
      ).deliver_now
    end
    render nothing: true, status: 200
  rescue => message
    render json: message, status: 500
  end
end
