class Plot < ApplicationRecord
  belongs_to :credit_solicitation

  validates :payment_day, presence: true
  validates :value, presence: true
end
