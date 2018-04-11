class AddImageToOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :image, :string
  end
end
