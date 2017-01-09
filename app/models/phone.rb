# frozen_string_literal: true
# :nodoc:
class Phone < ApplicationRecord
  def phone
    data.phone
  end

  def data
    @data ||= JSON.parse(self[:data], object_class: OpenStruct)
  rescue
    nil
  end
end
