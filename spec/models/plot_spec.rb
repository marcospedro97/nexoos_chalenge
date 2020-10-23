require 'rails_helper'

RSpec.describe Plot, type: :model do
  it 'should be valid' do
    expect(build(:plot_with_credit_solicitation)).to be_valid
  end

  it 'should validate value' do
    expect(build(:plot_with_credit_solicitation, value: nil))
      .not_to be_valid
  end

  it 'should validate payment_day' do
    expect(build(:plot_with_credit_solicitation, payment_day: nil))
      .not_to be_valid
  end
end
