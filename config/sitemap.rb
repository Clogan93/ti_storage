# frozen_string_literal: true
# use rake sitemap:refresh after you update it.
# it will recreate the /public/sitemap.xml.gz file.
# it's okay it's gzipped, most search englines read it just fine.
SitemapGenerator::Sitemap.default_host = "https://tistorage.com"
SitemapGenerator::Sitemap.sitemaps_host = "http://s3.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.create do
  add '/checkout', changefreq: 'monthly', priority: 0.3
  add '/search', changefreq: 'monthly', priority: 0.3

  # static pages
  add '/', changefreq: 'daily', priority: 1
  add '/storage-solutions', changefreq: 'weekly', priority: 0.7
  add '/faq', changefreq: 'weekly', priority: 0.7
  add '/contact', changefreq: 'monthly', priority: 0.3

  # storages
  add '/locations', changefreq: 'weekly', priority: 0.7

  add '/brooklyn', changefreq: 'weekly', priority: 0.7
  add '/queens', changefreq: 'weekly', priority: 0.7
  add '/new-jersey', changefreq: 'weekly', priority: 0.7

  add '/brooklyn/red-hook', changefreq: 'daily', priority: 0.9
  add '/queens/ozone-park', changefreq: 'daily', priority: 0.9
  add '/queens/jamaica', changefreq: 'daily', priority: 0.9
  add '/new-jersey/paterson', changefreq: 'daily', priority: 0.9
  add '/new-jersey/woodbridge', changefreq: 'daily', priority: 0.9

  # storage solutions
  add '/art-storage', changefreq: 'weekly', priority: 0.7
  add '/household-storage', changefreq: 'weekly', priority: 0.7
  add '/wine-storage', changefreq: 'weekly', priority: 0.7
  add '/boat-storage', changefreq: 'weekly', priority: 0.7
  add '/car-storage', changefreq: 'weekly', priority: 0.7
  add '/commercial-storage', changefreq: 'weekly', priority: 0.7
end
