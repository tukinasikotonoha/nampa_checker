FactoryBot.define do
  factory :result do
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/system/images/female1.jpg", 'image/png') }
    gender { :female }
    score { 80 }
    user

    trait :over_90 do
      score { 95 }
    end
  end
end
