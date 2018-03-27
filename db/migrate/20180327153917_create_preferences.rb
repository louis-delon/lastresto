class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.references :buyer, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
