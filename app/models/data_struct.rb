# frozen_string_literal: true
# :nodoc:
class DataStruct < OpenStruct
  def as_json(*args)
    super.as_json['table']
  end
end
