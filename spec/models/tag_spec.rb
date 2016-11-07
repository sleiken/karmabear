require "rails_helper"

RSpec.describe Tag do
  it "is valid with valid attributes" do
    expect(create(:tag)).to be_valid
  end

  it "is valid with several charity_tags" do
    charity_tags_count = 6
    tag = create(:tag, :with_charity_tags, charity_tags_count: charity_tags_count)

    expect(tag.charity_tags.length).to eq(charity_tags_count)
    expect(tag.charities.length).to eq(charity_tags_count)
    expect(tag).to be_valid
  end

  it "is invalid with nil name" do
    tag = build(:tag, name: nil)

    expect(tag).to be_invalid
  end
end
