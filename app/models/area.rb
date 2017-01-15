# frozen_string_literal: true
# :nodoc:
class Area < SimpleDelegator
  BROOKLYN = new(DataStruct.new(id: :brooklyn, title: "Brooklyn, NY"))
  QUEENS = new(DataStruct.new(id: :queens, title: "Queens, NY"))
  NEW_JERSEY = new(DataStruct.new(id: :"new-jersey", title: "New Jersey"))

  LOOKUP = {
    brooklyn: BROOKLYN,
    queens: QUEENS,
    "new-jersey": NEW_JERSEY
  }.freeze

  MAPPINGS = {
    "red-hook": BROOKLYN,
    jamaica: QUEENS,
    "ozone-park": QUEENS,
    paterson: NEW_JERSEY,
    woodbridge: NEW_JERSEY
  }.freeze

  SITES = {
    brooklyn: [Site::RED_HOOK],
    queens: [Site::JAMAICA, Site::OZONE_PARK],
    "new-jersey": [Site::PATERSON, Site::WOODBRIDGE]
  }.freeze

  def self.all
    [
      BROOKLYN,
      QUEENS,
      NEW_JERSEY
    ]
  end

  def self.for(site_slug)
    MAPPINGS[site_slug.to_sym]
  end

  def self.method_missing(method_name, *args, &block)
    if LOOKUP.keys.include?(method_name)
      LOOKUP[method_name]
    else
      super
    end
  end

  def slug
    id
  end

  def path_prefix
    slug.to_s.underscore
  end

  def sites
    @sites ||= SITES[slug]
  end
end
