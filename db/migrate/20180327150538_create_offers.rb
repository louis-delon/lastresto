class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :price
      t.datetime :date
      t.integer :duration
      t.text :description
      t.references :seller, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
