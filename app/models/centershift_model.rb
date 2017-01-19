# frozen_string_literal: true
# :nodoc:
class CentershiftModel < SimpleDelegator
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.api
    @@api ||= Centershift::Api
  end

  def self.from_centershift(attributes)
    new(DataStruct.new(attributes.deep_symbolize_keys!))
  end

  def persisted?
    id.present?
  end
end
