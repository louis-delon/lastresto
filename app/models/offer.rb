class Offer < ApplicationRecord

  belongs_to :seller
  belongs_to :category
  has_many :reservations, dependent: :destroy

  validates :title, presence:true, length: { minimum: 5 }
  validates :price, presence:true
  validates :date, presence:true
  validates :duration, presence:true
  validates :description, presence:true

  mount_uploader :image, PhotoUploader

end
