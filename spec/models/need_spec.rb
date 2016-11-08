require "rails_helper"

RSpec.describe Need do
  it "is valid with valid attributes" do
    expect(create(:need)).to be_valid
  end

  # it "is valid with several donations" do
  #   donations_count = 6
  #   need = create(:need, :with_donations, donations_count: donations_count)
  #
  #   expect(need.donations.length).to eq(donations_count)
  #   expect(need.givers.length).to eq(donations_count)
  #   expect(need).to be_valid
  # end

  it "is invalid with nil name" do
    need = build(:need, name: nil)

    expect(need).to be_invalid
  end

  it "is invalid without charity" do
    need = build(:need, charity: nil)

    expect(need).to be_invalid
  end
end
