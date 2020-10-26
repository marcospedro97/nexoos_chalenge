require 'rails_helper'

RSpec.describe CreditSolicitation, type: :model do
  it 'should be valid' do
    expect(build(:credit_solicitation)).to be_valid
  end

  it 'should validate value' do
    expect(build(:credit_solicitation, value: nil)).not_to be_valid
  end

  it 'should validate plot_tax_id' do
    expect(build(:credit_solicitation, plot_tax_id: nil)).not_to be_valid
  end

  it 'should check if user has any open plot' do
    applicant = create(:applicant)
    create(:credit_solicitation, applicant_id: applicant.id)
    expect(build(:credit_solicitation, applicant_id: applicant.id))
      .not_to be_valid
  end
end
