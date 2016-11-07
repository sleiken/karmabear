require "rails_helper"

RSpec.describe CharityTag do
  it "is valid with valid attributes" do
    expect(create(:charity_tag)).to be_valid
  end

  it "is invalid without tag" do
    charity_tag = build(:charity_tag, tag: nil)

    expect(charity_tag).to be_invalid
  end

  it "is invalid without charity" do
    charity_tag = build(:charity_tag, charity: nil)

    expect(charity_tag).to be_invalid
  end
end
