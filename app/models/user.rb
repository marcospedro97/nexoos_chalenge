class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :applicants, dependent: :destroy
  has_many :phones, through: :applicants
  has_many :addresses, through: :applicants
end
