class PlotTax < ApplicationRecord
  validates :plot, presence: true
  validates :tax, presence: true
end
