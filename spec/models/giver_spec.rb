require "rails_helper"

RSpec.describe Giver do
  it "is valid with valid attributes" do
    expect(create(:giver)).to be_valid
  end

  it "is valid with several subscriptions" do
    subscriptions_count = 6
    giver = create(:giver, :with_subscriptions, subscriptions_count: subscriptions_count)

    expect(giver.subscriptions.length).to eq(subscriptions_count)
    expect(giver.followed_charities.length).to eq(subscriptions_count)
    expect(giver).to be_valid
  end

  it "is valid with several locations" do
    locations_count = 6
    giver = create(:giver, :with_locations, locations_count: locations_count)

    expect(giver.locations.length).to eq(locations_count)
    expect(giver).to be_valid
  end

  it "is valid with several donations" do
    donations_count = 6
    giver = create(:giver, :with_donations, donations_count: donations_count)

    expect(giver.donations.length).to eq(donations_count)
    expect(giver.needs.length).to eq(donations_count)
    expect(giver).to be_valid
  end

  it "is valid with several registrations" do
    registrations_count = 6
    giver = create(:giver, :with_registrations, registrations_count: registrations_count)

    expect(giver.registrations.length).to eq(registrations_count)
    expect(giver.events.length).to eq(registrations_count)
    expect(giver).to be_valid
  end
end
