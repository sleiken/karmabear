require "rails_helper"

RSpec.describe Event do
  it "is valid with valid attributes" do
    expect(create(:event)).to be_valid
  end

  # it "is valid with several registrations" do
  #   registrations_count = 6
  #   event = create(:event, :with_registrations, registrations_count: registrations_count)
  #
  #   expect(event.registrations.length).to eq(registrations_count)
  #   expect(event.givers.length).to eq(registrations_count)
  #   expect(event).to be_valid
  # end

  it "is invalid with nil name" do
    event = build(:event, name: nil)

    expect(event).to be_invalid
  end

  it "is invalid without charity" do
    event = build(:event, charity: nil)

    expect(event).to be_invalid
  end
end
