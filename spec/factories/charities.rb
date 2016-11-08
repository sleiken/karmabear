require 'date'

FactoryGirl.define do
  factory :charity do
    name { Faker::Name.name }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    address { [Faker::Address.street_address] }

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end

    trait :with_events do
      transient do
        events_count 3
      end

      after(:create) do |charity, evaluator|
        create_list(:event, evaluator.events_count, charity: charity, description: "Test", start: DateTime.now, end: 2.days.from_now, givers_needed: 1)
      end
    end

    trait :with_needs do
      transient do
        needs_count 3
      end

      after(:create) do |charity, evaluator|
        create_list(:need, evaluator.needs_count, charity: charity, description: "Test", quantity_needed: 1)
      end
    end

    trait :with_subscriptions do
      transient do
        subscriptions_count 3
      end

      after(:create) do |charity, evaluator|
        FactoryGirl.create_list(:subscription, evaluator.subscriptions_count, charity: charity)
      end
    end
  end
end
