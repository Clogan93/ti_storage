# frozen_string_literal: true
# :nodoc:
class InsuranceProvider < CentershiftModel
  def self.where(site_id:)
    @@all ||= begin
      action = lambda do
        params = { "OrgID" => Organization.id, "SiteID" => site_id }
        api.get_insurance_providers(params).map do |provider|
          from_centershift(provider)
        end
      end
      Relations.new(&action)
    end
  end
end
