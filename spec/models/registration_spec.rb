require "rails_helper"

RSpec.describe Registration do
  it "is valid with valid attributes" do
    expect(create(:registration)).to be_valid
  end

  it "is invalid with nil pending_hours" do
    registration = build(:registration, pending_hours: nil)

    expect(registration).to be_invalid
  end

  it "is invalid with nil approved_hours" do
    registration = build(:registration, approved_hours: nil)

    expect(registration).to be_invalid
  end

  it "is invalid without event" do
    registration = build(:registration, event: nil)

    expect(registration).to be_invalid
  end

  it "is invalid without giver" do
    registration = build(:registration, giver: nil)

    expect(registration).to be_invalid
  end
end
