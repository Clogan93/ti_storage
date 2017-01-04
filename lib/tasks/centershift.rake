# frozen_string_literal: true
namespace :centershift do
  namespace :sites do
    desc "Sync sites from Centershift"
    task sync: :environment do
      CentershiftSynchronizer::Sites.new.call
    end
  end
end
