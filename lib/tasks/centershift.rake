# frozen_string_literal: true
namespace :centershift do
  namespace :sites do
    desc "Sync sites from Centershift"
    task sync: :environment do
      CentershiftSynchronizer::Sites.new.call
    end
  end

  namespace :units do
    desc "Sync units from Centershift"
    task sync: :environment do
      Storage.all.each do |storage|
        CentershiftSynchronizer::Units.new(site_id: storage.site_id).call
      end
    end
  end
end
