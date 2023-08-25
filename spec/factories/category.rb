FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon do
      Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'mcdonalds.png'), 'image/png')
    end
    association :user
  end
end
