require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it 'should be valid' do
    expect(build(:applicant)).to be_valid
  end

  it 'should validate CNPJ' do
    expect(build(:applicant, cnpj: nil)).not_to be_valid
  end

  it 'should validate social_name' do
    expect(build(:applicant, social_name: nil)).not_to be_valid
  end

  it 'should validate phones' do
    expect(build(:applicant, phones: [])).not_to be_valid
  end

  it 'should validate addresses' do
    expect(build(:applicant, addresses: [])).not_to be_valid
  end
end
