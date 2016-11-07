FactoryGirl.define do
  factory :giver do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end

    trait :with_subscriptions do
      transient do
        subscriptions_count 3
      end

      after(:create) do |giver, evaluator|
        FactoryGirl.create_list(:subscription, evaluator.subscriptions_count, giver: giver)
      end
    end

    trait :with_locations do
      transient do
        locations_count 3
      end

      after(:create) do |giver, evaluator|
        FactoryGirl.create_list(:location, evaluator.locations_count, giver: giver)
      end
    end

    trait :with_donations do
      transient do
        donations_count 3
      end

      after(:create) do |giver, evaluator|
        FactoryGirl.create_list(:donation, evaluator.donations_count, giver: giver)
      end
    end

    trait :with_registrations do
      transient do
        registrations_count 3
      end

      after(:create) do |giver, evaluator|
        FactoryGirl.create_list(:registration, evaluator.registrations_count, giver: giver)
      end
    end
  end
end
