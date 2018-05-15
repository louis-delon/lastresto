class Category < ApplicationRecord

  has_many :preferences
  has_many :offers
  validates :name, presence:true

end
