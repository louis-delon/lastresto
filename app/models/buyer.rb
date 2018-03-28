class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :preferences, dependent: :destroy

  validates :pseudo, presence:true, length: {minimum: 3}
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :phone, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
