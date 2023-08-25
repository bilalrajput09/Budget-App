if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
    config.root = Rails.root.join('spec', 'fixtures', 'test_uploads')
  end
end
