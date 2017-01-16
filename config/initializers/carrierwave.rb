CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/"
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = ENV['AWS_BUCKET_NAME']
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end
