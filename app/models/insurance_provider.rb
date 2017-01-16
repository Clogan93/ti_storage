# frozen_string_literal: true
# :nodoc:
class InsuranceProvider < CentershiftModel
  def self.where(site_id:)
    action = lambda do
      params = { "OrgID" => Organization.id, "SiteID" => site_id }
      api.get_insurance_providers(params).map do |provider|
        from_centershift(provider)
      end
    end
    Relations.new(&action)
  end

  def description
    desc1.strip
  end

  def id
    ins_option_id.to_i
  end

  def default?
    default_option.eql?('Y')
  end

  def insurance_option_id
    ins_option_id
  end
end
