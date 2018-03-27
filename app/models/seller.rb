class Seller < ApplicationRecord

  has_many :offers
  has_many :reservations

  validates :name, presence:true
  validates :adress, presence:true
  validates :zip_code, presence:true
  validates :city, presence:true
  validates :type, presence:true
  validates :phone_number, presence:true

end
