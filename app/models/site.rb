# frozen_string_literal: true
# :nodoc:
class Site < CentershiftModel
  def self.all(organization_id: Organization.id)
    @@all ||= begin
      action = lambda do
        params = { "OrgID" => organization_id }
        api.get_site_list(params).map do |site|
          slug = site_id_to_slug(site.fetch(:site_id))
          from_centershift(site.merge(config(slug)))
        end
      end
      Relations.new(&action)
    end
  end

  def self.site_id_to_slug(site_id)
    Rails.configuration.sites.dig("site_id_to_slug", site_id.to_i)
  end

  def self.find(slug)
    site_config = config(slug)
    params = { "SiteID" => [{ "long" => site_config.fetch(:id) }] }
    from_centershift(api.get_site_details(params).merge(site_config))
  end

  def self.config(slug)
    Rails.configuration.sites.dig(slug.to_s).with_indifferent_access
  end

  def to_param
    slug
  end

  def email
    "#{slug.delete('-')}@tistorage.com"
  end

  def units
    @units ||= Unit.where(site_id: id)
  end

  def area
    @area ||= Area.for(slug)
  end

  def insurance_providers
    @insurance_providers ||= InsuranceProvider.where(site_id: id)
  end

  def default_insurance_provider
    @default_insurance_provider ||= insurance_providers.detect(&:default?)
  end

  RED_HOOK = Site.all.find { |site| site.slug.to_sym.eql?(:"red-hook") }
  JAMAICA = Site.all.find { |site| site.slug.to_sym.eql?(:jamaica) }
  OZONE_PARK = Site.all.find { |site| site.slug.to_sym.eql?(:"ozone-park") }
  PATERSON = Site.all.find { |site| site.slug.to_sym.eql?(:paterson) }
  WOODBRIDGE = Site.all.find { |site| site.slug.to_sym.eql?(:woodbridge) }

  SITES = [RED_HOOK, JAMAICA, OZONE_PARK, PATERSON, WOODBRIDGE].freeze

  LOOKUP = SITES.map { |site| [site.id.to_i, site] }.to_h

  MAPPINGS = {
    "red-hook": RED_HOOK,
    jamaica: JAMAICA,
    "ozone-park": OZONE_PARK,
    paterson: PATERSON,
    woodbridge: WOODBRIDGE
  }.freeze
end
