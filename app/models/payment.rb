# frozen_string_literal: true
# :nodoc:
class Payment < CentershiftModel
  def self.credit_card_info_attributes(attributes)
    {
      "Amount" => attributes.fetch(:total_amount_paid),
      "CardNumber" => attributes.fetch(:card_number),
      "CardHolderName" => attributes.fetch(:card_holder_name),
      "ExpireMonth" => attributes.fetch(:expire_month),
      "ExpireYear" => attributes.fetch(:expire_year),
      "CVV2" => attributes.fetch(:cvv2),
      "Address" => attributes.fetch(:address, nil),
      "PostalCode" => attributes.fetch(:postal_code)
    }
  end

  def id
    tran_id.to_i
  end
end
