FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    role { :general }
  end
end
