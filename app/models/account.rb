# frozen_string_literal: true
# :nodoc:
class Account < CentershiftModel
  def id
    account_id
  end

  def address
    @address ||= Address.from_centershift(addresses["acct_contact_addresses"])
  end

  def phone
    @phone ||= Phone.from_centershift(phones["acct_contact_phones"])
  end
end
