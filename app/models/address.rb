class Address < ApplicationRecord
  belongs_to :applicant

  validates :applicant, presence: true
  validates :street, presence: true
  validates :number, presence: true
end
