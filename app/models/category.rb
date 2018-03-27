class Category < ApplicationRecord

  belongs_to :preference
  belongs_to :offer
  validates :name, presence:true

end
