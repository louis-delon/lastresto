class Preference < ApplicationRecord

  belongs_to :buyer
  belongs_to :category

end
