class Applicant < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :credit_solicitations, dependent: :destroy

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :addresses

  validates :phones, length: { minimum: 1 }
  validates :addresses, length: { minimum: 1 }
  validates :user, presence: true
  validates :social_name, presence: true
  validates :cnpj, presence: true
end
