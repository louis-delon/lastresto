class Buyer < ApplicationRecord

  has_many :reservations
  has_many :preferences

end
