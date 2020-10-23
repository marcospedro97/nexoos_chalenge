class Phone < ApplicationRecord
  belongs_to :applicant

  validates :applicant, presence: true
  validates :number, presence: true, uniqueness: true
end
