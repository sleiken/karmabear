FactoryGirl.define do
  factory :tag do
    name { Faker::Name.name }

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end

    trait :with_charity_tags do
      transient do
        charity_tags_count 3
      end

      after(:create) do |tag, evaluator|
        FactoryGirl.create_list(:charity_tag, evaluator.charity_tags_count, tag: tag)
      end
    end
  end
end
