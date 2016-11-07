require "rails_helper"

RSpec.describe Location do
  it "is valid with valid attributes" do
    expect(create(:location)).to be_valid
  end

  it "is invalid with nil name" do
    location = build(:location, name: nil)

    expect(location).to be_invalid
  end

  it "is invalid with nil lat" do
    location = build(:location, lat: nil)

    expect(location).to be_invalid
  end

  it "is invalid with nil lng" do
    location = build(:location, lng: nil)

    expect(location).to be_invalid
  end

  it "is invalid without giver" do
    location = build(:location, giver: nil)

    expect(location).to be_invalid
  end
end
