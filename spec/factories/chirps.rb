FactoryBot.define do
  factory :chirp do
    user
    body { Faker::Lorem.sentence }
  end
end
