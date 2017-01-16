# frozen_string_literal: true
# rubocop:disable MethodLength
# rubocop:disable LineLength
# rubocop:disable Metrics/AbcSize
# :nodoc:
class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # ___why rescue block?
  # http://stackoverflow.com/questions/32999581/rails-error-checking-for-email-delivery-deliver-now
  def send_sign_up_for_emails_email
    AdminMailer.sign_up_for_emails_email(
      params[:name], params[:email]
    ).deliver_later
    render nothing: true, status: 200
  rescue => message
    render json: message, status: 500
  end

  def send_contact_email
    common_params = params.permit(:name, :email, :phone, :message)
    if params[:is_current_customer] == 'false'
      new_customer_params = common_params.merge(params.permit(:where_from_heard_about_us))
      AdminMailer.new_customer_contacts_us_email(new_customer_params).deliver_later
    else
      old_customer_params = common_params.merge(params.permit(:storage_used))
      AdminMailer.old_customer_contacts_us_email(old_customer_params).deliver_later
    end
    render nothing: true, status: 200
  rescue => message
    render json: message, status: 500
  end
end
