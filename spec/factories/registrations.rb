FactoryGirl.define do
  factory :registration do
    association :event
    association :giver

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end
  end
end
