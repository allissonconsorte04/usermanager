FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { '1234567' }
    password_confirmation { '1234567' }
    role { User::ROLES[:USER] }

    trait :admin do
      role { User::ROLES[:ADMIN] }
    end
  end
end
