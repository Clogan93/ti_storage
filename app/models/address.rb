# frozen_string_literal: true
# :nodoc:
class Address < ApplicationRecord
  def address_1
    data.addr1
  end

  def address_2
    data.addr2
  end

  def city
    data.city
  end

  def state
    data.state
  end

  def postal_code
    data.postal_code
  end

  def data
    @data ||= JSON.parse(self[:data], object_class: OpenStruct)
  rescue
    nil
  end
end
