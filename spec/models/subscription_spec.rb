require "rails_helper"

RSpec.describe Subscription do
  it "is valid with valid attributes" do
    expect(create(:subscription)).to be_valid
  end

  it "is invalid without charity" do
    subscription = build(:subscription, charity: nil)

    expect(subscription).to be_invalid
  end

  it "is invalid without giver" do
    subscription = build(:subscription, giver: nil)

    expect(subscription).to be_invalid
  end
end
