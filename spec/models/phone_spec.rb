require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'should be valid' do
    expect(build(:phone)).to be_valid
  end

  it 'should validate applicant' do
    expect(build(:phone_without_applicant)).not_to be_valid
  end

  it 'should validate number' do
    expect(build(:phone, number: nil)).not_to be_valid
  end

  it 'should validate number uniqueness' do
    previous_phone = create(:phone)
    expect(build(:phone, number: previous_phone.number))
      .not_to be_valid
  end
end
