require 'rails_helper'

RSpec.describe CreditSolicitation, type: :model do
  it 'should be valid' do
    expect(build(:credit_solicitation_with_applicant)).to be_valid
  end

  it 'it should validate applicant' do
    expect(build(:credit_solicitation)).not_to be_valid
  end

  it 'should validate value' do
    expect(build(:credit_solicitation_with_applicant, value: nil)).not_to be_valid
  end

  it 'should validate plots' do
    expect(build(:credit_solicitation_with_applicant, plots: nil)).not_to be_valid
  end

  it 'should validate interest rate' do
    expect(build(:credit_solicitation_with_applicant, interest_rate: nil)).not_to be_valid
  end
end
