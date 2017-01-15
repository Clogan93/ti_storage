# frozen_string_literal: true
# :nodoc:
class CartFormPresenter < BasePresenter
  def account
    @account ||= DataStruct.new(account_params)
  end

  def address
    @address ||= DataStruct.new(address_params)
  end

  def phone
    @phone ||= DataStruct.new(phone_params)
  end

  def payment
    @payment ||= DataStruct.new(payment_params)
  end
end
