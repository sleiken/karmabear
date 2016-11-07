require "rails_helper"

RSpec.describe Manager do
  it "is valid with valid attributes" do
    expect(create(:manager)).to be_valid
  end
end
