FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:name) { |n| "user#{n}" }
    role { :general }

    trait :admin do
      sequence(:email) { |n| "admin#{n}@example.com" }
      sequence(:name) { |n| "admin#{n}" }
      role { :admin }
    end
  end
end
