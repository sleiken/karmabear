FactoryGirl.define do
  factory :manager do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

    association :charity

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end
  end
end
