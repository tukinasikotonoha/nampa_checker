FactoryBot.define do
  factory :user do
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:name) { |n| "user#{n}" }
    role { :general }

    trait :admin do
      email { 'admin@example.com' }
      sequence(:name) { |n| "admin#{n}" }
      role { :admin }
    end
  end
end
