class Reservation < ApplicationRecord

  belongs_to :seller
  belongs_to :buyer
  belongs_to :offer

  validates :time, presence:true

end
