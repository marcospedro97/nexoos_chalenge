class CreditSolicitation < ApplicationRecord
  belongs_to :applicant

  validates :value, presence: true
  validates :plots, presence: true
  validates :interest_rate, presence: true
end
