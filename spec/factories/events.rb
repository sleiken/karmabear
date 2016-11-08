FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    start { DateTime.now }
    add_attribute :end, 2.days.from_now
    givers_needed { Faker::Number.number(3) }


    association :charity

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end

    trait :with_registrations do
      transient do
        registrations_count 3
      end

      after(:create) do |event, evaluator|
        FactoryGirl.create_list(:registration, evaluator.registrations_count, event: event)
      end
    end
  end
end
