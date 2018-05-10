class Reservation < ApplicationRecord

  belongs_to :buyer
  belongs_to :offer

  validates :time, presence:true
  validates :number_of_persons, presence:true

end
