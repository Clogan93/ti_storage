# frozen_string_literal: true
# :nodoc:
class Reservation < CentershiftModel
  def id
    quote_id.to_i
  end
end
