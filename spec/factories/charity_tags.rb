FactoryGirl.define do
  factory :charity_tag do

    association :tag
    association :charity

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end
  end
end
