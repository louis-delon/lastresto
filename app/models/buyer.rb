class Buyer < ApplicationRecord

  has_many :reservations
  has_many :preferences

  validates :pseudo, presence:true, length: {minimum: 3}
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :phone, presence:true

end
