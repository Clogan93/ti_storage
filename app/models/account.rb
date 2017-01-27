# frozen_string_literal: true
# :nodoc:
class Account < CentershiftModel
  def id
    account_id.to_i
  end

  def name
    params.slice(:first_name, :last_name).values.join(" ")
  end

  def address
    @address ||= Address.from_centershift(addresses[:acct_contact_addresses])
  end

  def phone
    @phone ||= Phone.from_centershift(phones[:acct_contact_phones])
  end

  def email
    params[:email]
  end
end
