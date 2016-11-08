FactoryGirl.define do
  factory :location do
    name { Faker::Name.name }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }

    association :giver

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end
  end
end
