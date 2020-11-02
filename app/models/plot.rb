class Plot < ApplicationRecord
  belongs_to :credit_solicitation

  validates :payment_day, presence: true
  validates :value, presence: true

  def self.open(credit_solicitation)
    where('credit_solicitation_id = :credit_solicitation AND
      payment_day > :today', credit_solicitation: credit_solicitation,
                             today: Date.current)
  end
end
