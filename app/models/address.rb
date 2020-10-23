class Address < ApplicationRecord
  belongs_to :applicant

  validates :applicant, presence: true
  validates :street, presence: true
  validates :number, presence: true
  validates :zip_code, presence: true
end
