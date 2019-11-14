CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => Rails.application.credentials.aws[:access_key_id],
      :aws_secret_access_key  => Rails.application.credentials.aws[:secret_access_key],
      :region                 => 'us-east-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'lab-fisica-pdfs'                     # required
  config.storage = :fog
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end