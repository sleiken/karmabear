require "rails_helper"

RSpec.describe Charity do
  it "is valid with valid attributes" do
    expect(create(:charity)).to be_valid
  end

  it "is valid with several events" do
    events_count = 6
    charity = create(:charity, :with_events, events_count: events_count)

    expect(charity.events.length).to eq(events_count)
    expect(charity).to be_valid
  end

  it "is valid with several needs" do
    needs_count = 6
    charity = create(:charity, :with_needs, needs_count: needs_count)

    expect(charity.needs.length).to eq(needs_count)
    expect(charity).to be_valid
  end

  it "is valid with several subscriptions" do
    subscriptions_count = 6
    charity = create(:charity, :with_subscriptions, subscriptions_count: subscriptions_count)

    expect(charity.subscriptions.length).to eq(subscriptions_count)
    expect(charity.followers.length).to eq(subscriptions_count)
    expect(charity).to be_valid
  end

  it "is invalid with nil name" do
    charity = build(:charity, name: nil)

    expect(charity).to be_invalid
  end

  it "is invalid with nil lat" do
    charity = build(:charity, lat: nil)

    expect(charity).to be_invalid
  end

  it "is invalid with nil lng" do
    charity = build(:charity, lng: nil)

    expect(charity).to be_invalid
  end

  it "is invalid with nil address" do
    charity = build(:charity, address: nil)

    expect(charity).to be_invalid
  end
end
