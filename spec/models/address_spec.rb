require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should be valid' do
    expect(build(:address)).to be_valid
  end

  it 'should validate applicant' do
    expect(build(:address_without_applicant)).not_to be_valid
  end

  it 'should validate street' do
    expect(build(:address, street: nil)).not_to be_valid
  end

  it 'should validate number' do
    expect(build(:address, number: nil)).not_to be_valid
  end

  it 'should be abble to keep complement nil' do
    expect(build(:address, complement: nil)).to be_valid
  end
end
