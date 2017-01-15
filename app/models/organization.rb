# frozen_string_literal: true
# :nodoc:
class Organization < CentershiftModel
  class << self
    def instance
      @@instance ||= from_centershift(api.get_org_list)
    end

    def id
      org_id.to_i
    end

    def method_missing(method_name, *args, &block)
      if instance.respond_to?(method_name)
        instance.send(method_name, *args, &block)
      else
        super
      end
    end
  end
end
