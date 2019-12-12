FactoryBot.define do
  factory :result do
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/system/images/female1.jpg", 'image/png') }
    gender { 'male' }
    user
  end
end
