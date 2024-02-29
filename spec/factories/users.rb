FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::FunnyName.name }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    bio { Faker::Lorem.sentence }
  end
end
