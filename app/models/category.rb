class Category < ApplicationRecord

  has_many :preferences
  has_many :offer
  validates :name, presence:true

end
