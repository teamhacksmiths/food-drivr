require 'rails_helper'

RSpec.describe Donation, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:donation)).to be_valid
  end
  it 'creates a valid status set to pending with a status id of 0' do
    donation = FactoryGirl.create(:donation)
    expect(donation.status.id).to eq(0)
  end
end
