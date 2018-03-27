class Offer < ApplicationRecord

  belongs_to :seller
  belongs_to :category
  has_many :reservations

  validates :title, presence:true length: { minimum: 5 }
  validates :price, presence:true
  validates :date, presence:true
  validates :duration, presence:true
  validates :description, presence:true

end
