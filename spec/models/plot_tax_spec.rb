require 'rails_helper'

RSpec.describe PlotTax, type: :model do
  it 'should be valid' do
    expect(build(:plot_tax)).to be_valid
  end

  it 'should validate plot' do
    expect(build(:plot_tax, plot: nil)).not_to be_valid
  end

  it 'should validate tax' do
    expect(build(:plot_tax, tax: nil)).not_to be_valid
  end
end
