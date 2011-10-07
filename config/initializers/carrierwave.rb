CarrierWave.configure do |config|
  # config.fog_credentials = {
  #   :provider => 'AWS',
  #   :aws_access_key_id => 'AKIAJTPIIBA7B6OJ5VWA',
  #   :aws_secret_access_key => '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'
  # }
  # config.fog_directory = 'Repairer'
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  
  config.s3_access_key_id = 'AKIAJTPIIBA7B6OJ5VWA'
  config.s3_secret_access_key = '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'
  config.s3_bucket = 'repairer'
end