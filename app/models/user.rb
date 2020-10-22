class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :applicant, inverse_of: :user
  has_many :phones, through: :applicant
  has_many :addresses, through: :applicant
end
