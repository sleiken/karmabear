require "rails_helper"

RSpec.describe Donation do
  it "is valid with valid attributes" do
    expect(create(:donation)).to be_valid
  end

  it "is invalid with nil quantity_pending" do
    donation = build(:donation, quantity_pending: nil)

    expect(donation).to be_invalid
  end

  it "is invalid with nil quantity_pending" do
    donation = build(:donation, quantity_approved: nil)

    expect(donation).to be_invalid
  end

  it "is invalid without need" do
    donation = build(:donation, need: nil)

    expect(donation).to be_invalid
  end

  it "is invalid without giver" do
    donation = build(:donation, giver: nil)

    expect(donation).to be_invalid
  end
end
